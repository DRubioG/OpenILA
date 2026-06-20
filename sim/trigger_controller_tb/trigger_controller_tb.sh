nvc -a ../../src/trigger_controller.vhd

nvc -a trigger_controller_tb.vhd

nvc -e trigger_controller_tb

nvc -r trigger_controller_tb --stop-time=400ns --wave=trigger_controller_tb.vcd