HAMMER_EXEC ?= /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_run
HAMMER_DEPENDENCIES ?= /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml /home/projects/ee477.2023wtr/cad/hammer_env.yml /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/v/rom_sbox.v


####################################################################################
## Global steps
####################################################################################
.PHONY: pcb
pcb: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/pcb-rundir/pcb-output-full.json

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/pcb-rundir/pcb-output-full.json: $(HAMMER_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml -p /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build pcb


####################################################################################
## Steps for TOP_MODULE
####################################################################################
.PHONY: sim-rtl syn syn-to-sim sim-syn syn-to-par par par-to-sim sim-par sim-par-to-power par-to-power power-par par-to-drc drc par-to-lvs lvs syn-to-formal formal-syn par-to-formal formal-par syn-to-timing timing-syn par-to-timing timing-par

#sim-rtl          : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-rtl-rundir/sim-output-full.json
syn              : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json

syn-to-sim       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json
#sim-syn          : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-rundir/sim-output-full.json

syn-to-par       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json
par              : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json

par-to-sim       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json
#sim-par          : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir/sim-output-full.json

#sim-par-to-power : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json
par-to-power     : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json
power-par        : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-rundir/power-output-full.json

par-to-drc       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json
drc              : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-rundir/drc-output-full.json

par-to-lvs       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json
lvs              : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-rundir/lvs-output-full.json

syn-to-formal    : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json
formal-syn       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-rundir/formal-output-full.json

par-to-formal    : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json
formal-par       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-rundir/formal-output-full.json

syn-to-timing    : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json
timing-syn       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-rundir/timing-output-full.json

par-to-timing    : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json
timing-par       : /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-rundir/timing-output-full.json



/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-rtl-rundir/sim-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SIM_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml -p /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-rtl-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml -p /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-sim

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-rundir/sim-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json $(HAMMER_SIM_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-par

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json $(HAMMER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-sim

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir/sim-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json $(HAMMER_SIM_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim-to-power

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-power

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-rundir/power-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json $(HAMMER_POWER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build power

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-drc

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-rundir/drc-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json $(HAMMER_DRC_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build drc

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-lvs

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-rundir/lvs-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json $(HAMMER_LVS_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build lvs

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-formal

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-rundir/formal-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json $(HAMMER_FORMAL_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build formal

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-formal

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-rundir/formal-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json $(HAMMER_FORMAL_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build formal

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-timing

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-rundir/timing-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json $(HAMMER_TIMING_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build timing

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-timing

/home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-rundir/timing-output-full.json: /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json $(HAMMER_TIMING_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build timing

# Redo steps
# These intentionally break the dependency graph, but allow the flexibility to rerun a step after changing a config.
# Hammer doesn't know what settings impact synthesis only, e.g., so these are for power-users who "know better."
# The HAMMER_EXTRA_ARGS variable allows patching in of new configurations with -p or using --to_step or --from_step, for example.
.PHONY: redo-sim-rtl redo-syn redo-syn-to-sim redo-sim-syn redo-syn-to-par redo-par redo-par-to-sim redo-sim-par redo-sim-par-to-power redo-par-to-power redo-power-par redo-par-to-drc redo-drc redo-par-to-lvs redo-lvs redo-syn-to-formal redo-formal-syn redo-par-to-formal redo-formal-par redo-syn-to-timing redo-timing-syn redo-par-to-timing redo-timing-par

#redo-sim-rtl:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml -p /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-rtl-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

redo-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/paths.yml -p /home/hyu3/Documents/22024/526/ee477-hammer-cad/hammer_cfg_top.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/cfg.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/cfg/src.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn

redo-syn-to-sim:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-sim

#redo-sim-syn:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

redo-syn-to-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-par

redo-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par

redo-par-to-sim:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-sim

#redo-sim-par:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-input.json $(SIM_EXTRA_ARGS) $(HAMMER_EXTRA_ARGS) --sim_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim

#redo-sim-par-to-power:
#	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build sim-to-power

redo-par-to-power:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-power

redo-power-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-sim-par-input.json -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/power-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build power

redo-par-to-drc:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-drc

redo-drc:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build drc

redo-par-to-lvs:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-lvs

redo-lvs:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build lvs

redo-syn-to-formal:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-formal

redo-formal-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build formal

redo-par-to-formal:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-formal

redo-formal-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/formal-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build formal

redo-syn-to-timing:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build syn-to-timing

redo-timing-syn:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-syn-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build timing

redo-par-to-timing:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build par-to-timing

redo-timing-par:
	$(HAMMER_EXEC) -e /home/projects/ee477.2023wtr/cad/hammer_env.yml -p /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build/timing-par-rundir --obj_dir /home/hyu3/Documents/22024/526/bsg_aes/aes_algorithm_chip/build timing

