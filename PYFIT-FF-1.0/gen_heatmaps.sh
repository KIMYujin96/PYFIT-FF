python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-01/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-01.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-02/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-02.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-03/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-03.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-04/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-04.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-05/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-05.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-06/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-06.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-07/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-07.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-08/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-08.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-09/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-09.json
python3 scripts/EvalNN.py average-error-and-rcf-consistency-study/results/IC-10/out/nn1.dat input/AB/AB-LSPARAM-E-full-NO-B00-B01-B02.dat average-error-and-rcf-consistency-study/results/out-IC-10.json

python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-01.json average-error-and-rcf-consistency-study/results/IC-01/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-01-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-02.json average-error-and-rcf-consistency-study/results/IC-02/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-02-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-03.json average-error-and-rcf-consistency-study/results/IC-03/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-03-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-04.json average-error-and-rcf-consistency-study/results/IC-04/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-04-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-05.json average-error-and-rcf-consistency-study/results/IC-05/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-05-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-06.json average-error-and-rcf-consistency-study/results/IC-06/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-06-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-07.json average-error-and-rcf-consistency-study/results/IC-07/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-07-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-08.json average-error-and-rcf-consistency-study/results/IC-08/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-08-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-09.json average-error-and-rcf-consistency-study/results/IC-09/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-09-correlation.json
python3 scripts/CFCorrelationCalc.py average-error-and-rcf-consistency-study/results/out-IC-10.json average-error-and-rcf-consistency-study/results/IC-10/out/nn1.dat average-error-and-rcf-consistency-study/results/out-IC-10-correlation.json

python3 scripts/CFHeatmap.py big_heatmap.png n average-error-and-rcf-consistency-study/results/out-IC-01-correlation.json average-error-and-rcf-consistency-study/results/out-IC-02-correlation.json average-error-and-rcf-consistency-study/results/out-IC-03-correlation.json average-error-and-rcf-consistency-study/results/out-IC-04-correlation.json average-error-and-rcf-consistency-study/results/out-IC-05-correlation.json average-error-and-rcf-consistency-study/results/out-IC-06-correlation.json average-error-and-rcf-consistency-study/results/out-IC-07-correlation.json average-error-and-rcf-consistency-study/results/out-IC-08-correlation.json average-error-and-rcf-consistency-study/results/out-IC-09-correlation.json average-error-and-rcf-consistency-study/results/out-IC-10-correlation.json