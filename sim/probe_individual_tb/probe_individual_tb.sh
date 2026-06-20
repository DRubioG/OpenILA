nvc -a ../../src/trigger_controller.vhd
nvc -a ../../src/LFSR.vhd
nvc -a ../../src/probe_individual.vhd

nvc -a probe_individual_tb.vhd

nvc -e probe_individual_tb

nvc -r probe_individual_tb --stop-time=1100ns --wave=probe_individual_tb.vcd --dump-arrays