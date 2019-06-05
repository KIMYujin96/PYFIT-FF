# Name of this file, used for error messages.
CONFIG_FNAME                       = __file__

# File to use for writing log information.
LOG_PATH                           = 'output/log.txt'

# The neural network file to load.
NEURAL_NETWORK_FILE                = 'input/new2/nn1.dat'

# --------------------------------------------------
# Structural Parameter Calculation Configuration
# --------------------------------------------------

POSCAR_DATA_FILE = 'input/new2/train.dat'

# The parameter file to output. This is what gets used for neural network
# training during the next step (usually). If you want the program to train
# on this file immediately after generating it, specify the same file for
# the TRAINING_SET_FILE parameter and pass the --run-training flag to the
# program.
LSPARAM_FILE     = 'output/generated.dat'

# The file to store training data and neighbors lists in. If you don't specify this
# it won't get written.
NEIGHBOR_FILE    = 'output/nbl.dat'


# --------------------------------------------------
# Neural Network Training Configuration
# --------------------------------------------------


# Network Loss Log File Path
LOSS_LOG_PATH                      = 'output/loss_log.txt'

# Print training error every PROGRESS_INTERVAL epochs.
PROGRESS_INTERVAL = 5

# The structure file that contains POSCAR structures
# and DFT energies.
TRAINING_SET_FILE                  = 'output/generated.dat'

# Where to save the neural network when done training it.
NEURAL_NETWORK_SAVE_FILE           = 'output/nn1.dat'

# The file to store the E_VS_V data in.
# Each line will be all volumes in order followed
# immediately by all energies in order.
E_VS_V_FILE                        = 'output/E_VS_V.txt'

# Interval at which energy vs. volume data is exported.
E_VS_V_INTERVAL = 100

# Energy shift per atom for DFT (for pre-processing use 0)
E_SHIFT = 0.0 

# The ratio of training data to overall amount of data.
TRAIN_TO_TOTAL_RATIO = 1.0 

# Contains values that indicate how heavily weighted each subgroup
# should be when computing the error.
WEIGHTS = {}
# Example: WEIGHTS['Si_B1']=1.0

# Standard NN learning rate.
LEARNING_RATE = 0.01

# Which torch.optim algorithm to use.
OPTIMIZATION_ALGORITHM = 'LBFGS'

# Maximum number of iterations for an LBFGS optimization step.
MAX_LBFGS_ITERATIONS = 10

# Maximum number of epochs to run through for training.
MAXIMUM_TRAINING_ITERATIONS = 10