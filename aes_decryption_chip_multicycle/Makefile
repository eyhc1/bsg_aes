# Make file for a Hammer project

# TODO: Make sure this is set to the top level directory containing module_top.mk
TOP_DIR = $(realpath ../../ee477-hammer-cad)

# Build directory location
OBJ_DIR = build

# TODO: If you change the names of these files, update them here to reflect.
INPUT_CFGS =cfg/cfg.yml cfg/src.yml
TB_CFGS = cfg/tb.yml

.PHONY: $(TRACE_FILE)
$(TRACE_FILE):
	python3 ./py/gen_trace.py

# Main Hammer Targets
include $(TOP_DIR)/module_top.mk
