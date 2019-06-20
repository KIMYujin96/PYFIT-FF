import torch
import torch.nn            as nn
import torch.nn.functional as F
import torch.optim         as optim
import numpy               as np
import copy

# This class handles the process of loading information from the raw
# set of neural network weights and biases into a proper PyTorch neural
# network class. This is also the object that is actually called to 
# evaluate the network. It also contains functionality for dumping the
# values back out into a format that can be written into a file again.
class TorchNet(nn.Module):
	def __init__(self, network_data, reduction_matrix=None, only_eval=False):
		super(TorchNet, self).__init__()

		# Here we need to instantiate and instance of a linear
		# transformation for each real layer of the network and
		# populate its data members with the weights and biases
		# that we want.

		# We have to use the ParameterList class here because the 
		# regular Python list isn't recognized by PyTorch and 
		# subsequent calls to TorchNet.parameters() will not work.
		self.layers           = []
		self.params           = nn.ParameterList()
		self.activation_mode  = network_data.config.activation_function
		if not only_eval:
			self.reduction_matrix = reduction_matrix
			self.eval_only = False
		else:
			self.eval_only = True
		self.offset           = torch.tensor(0.5)

		# Create a set of linear transforms.
		for idx in range(len(network_data.config.layer_sizes)):
			if idx != 0:
				prev_layer_size = network_data.config.layer_sizes[idx - 1]
				curr_layer_size = network_data.config.layer_sizes[idx]
				layer           = nn.Linear(prev_layer_size, curr_layer_size)
				current_layer   = network_data.layers[idx - 1]
				with torch.no_grad():
					layer.weight.copy_(torch.tensor([node[0] for node in current_layer]))
					layer.bias.copy_(torch.tensor([node[1] for node in current_layer]))
				self.layers.append(layer)
				self.params.extend(layer.parameters())

	def to(self, device):
		super(TorchNet, self).to(device)
		self.reduction_matrix = self.reduction_matrix.to(device)
		self.offset           = self.offset.to(device)
		return self

	def cpu(self):
		return self.to('cpu')

	def print_device_info(self):
		for param in self.params:
			print("Parameter: %s"%(str(param.device)))

		print("Reduction Matrix: %s"%str(self.reduction_matrix.device))
		print("Offset: %s"%str(self.offset.device))


	def randomize_self(self, relative_standard_deviation):
		# For each parameter in self.params, we need to add a
		# normal distributed random number with a standard deviation
		# equal to PLATEAU_ANNEALING_RAND_STD times its absolute value.
		for param in self.params:
			if len(param.data.shape) == 2:
				# This is a two dimensional parameter and therefore
				# a set of weights.
				for node_idx in range(len(param.data)):
					for weight_idx in range(len(param.data[node_idx])):

						value = np.abs(relative_standard_deviation*param.data[node_idx][weight_idx])
						param.data[node_idx][weight_idx] += np.random.normal(0.0, value)

			elif len(param.data.shape) == 1:
				# This is a one dimensional parameter and therefore
				# an array of biases.
				for node_idx in range(len(param.data)):

					value = np.abs(relative_standard_deviation*param.data[node_idx])
					param.data[node_idx] += np.random.normal(0.0, value)

	def set_reduction_matrix(self, mat):
		self.reduction_matrix = mat

	# This is just used to provide a list of parameters to the
	# optimizer when it is initialized.
	def get_parameters(self):
		return self.params

	# This returns the weights and biases for the neural network 
	# in the same format that they were passed in as when initializing
	# the object. 
	def get_network_values(self):
		output_layers = []
		for layer in self.layers:
			nodes = []
			for node_idx in range(len(layer.weight.data)):
				nodes.append([layer.weight.data[node_idx].tolist(), layer.bias.data[node_idx].item()])
			output_layers.append(nodes)

		return output_layers

	# This function actually defines the operation of the Neural Network
	# during feed forward.
	def forward(self, x):
		# Activation mode 0 is regular sigmoid and mode 
		# 1 is sigmoid shifted by -0.5
		if self.activation_mode == 0:
			x0 = torch.sigmoid(self.layers[0](x))
			for layer in self.layers[1:-1]:
				x0 = torch.sigmoid(layer(x0))
		else:
			x0 = torch.sigmoid(self.layers[0](x)) - self.offset
			for layer in self.layers[1:-1]:
				x0 = torch.sigmoid(layer(x0)) - self.offset

		if not self.eval_only:
			x0 = self.reduction_matrix.mm(self.layers[-1](x0))
		else:
			x0 = self.layers[-1](x0)
		return x0

	def num_flat_features(self, x):
		size = x.size()[1:]
		num_features = 1
		for s in size:
			num_features *= s
		return num_features