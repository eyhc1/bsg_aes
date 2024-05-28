# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# Cadenv Include
include /home/projects/ee478.2024spr/cadenv/cadenv_ee.mk

# CAD Tool Paths
VCS_BIN = $(VCS_HOME)/bin
VERDI_BIN = $(VERDI_HOME)/bin
VCS_BIN_DIR = $(VCS_BIN)
export PATH:=$(PATH):$(VCS_BIN):$(VERDI_BIN)
export HDL_DIR = $(shell git rev-parse --show-toplevel)/aes_decryption_chip_multicycle
export PYTHONPATH := $(HDL_DIR)/py

# VCS Arguments
EXTRA_ARGS += +v2k -l vcs.log
EXTRA_ARGS += +vcs+vcdpluson
EXTRA_ARGS += +lint=all,noSVA-UA,noSVA-NSVU,noVCDE,noNS -assert svaext
EXTRA_ARGS += -cm line+fsm+branch+cond+tgl
EXTRA_ARGS += +vcs+dumpvars+waveform.vcd

# defaults
SIM ?= vcs
TOPLEVEL_LANG ?= verilog

# basejump_stl path
export BASEJUMP_STL_DIR = $(shell git rev-parse --show-toplevel)/../basejump_stl

# basejump_stl verilog header include path
EXTRA_ARGS += +incdir+$(BASEJUMP_STL_DIR)/bsg_misc

# basejump_stl verilog filelist
# TODO: change this to .sv if is using master branch of basejump stl
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_test/bsg_nonsynth_clock_gen.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_test/bsg_nonsynth_reset_gen.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_1r1w_small_hardened.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_tracker.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_en.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_reset.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_circular_ptr.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_chain.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_wait_cycles.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w_sync.v
VERILOG_SOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w_sync_synth.v

# testbench verilog filelist
VERILOG_SOURCES += $(HDL_DIR)/v/add_round_key.sv
VERILOG_SOURCES += $(HDL_DIR)/v/inv_shift_rows.sv
VERILOG_SOURCES += $(HDL_DIR)/v/rom_inv_sbox.sv
VERILOG_SOURCES += $(HDL_DIR)/v/inv_sub_bytes.sv
VERILOG_SOURCES += $(HDL_DIR)/v/multiplier.sv
VERILOG_SOURCES += $(HDL_DIR)/v/inv_mix_columns.sv
VERILOG_SOURCES += $(HDL_DIR)/v/aes_decryption.sv
VERILOG_SOURCES += $(HDL_DIR)/v/decryption_rounds.sv
VERILOG_SOURCES += $(HDL_DIR)/v/bsg_aes_decrypt.sv

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = bsg_aes_decrypt

# MODULE is the basename of the Python test file
MODULE = bsg_aes_decrypt_tb

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

# Clean simulation files
ee-clean:
	make clean
	rm -rf __pycache__ DVEfiles vcs.log vcdplus.vpd results.xml
	rm -rf verdiLog vdCovLog novas.conf novas.fsdb novas.rc novas_dump.log
	rm -rf waveform.vcd
