SHELL = /bin/bash
MAKEFILE := Makefile_raspbian

ifeq ($(CONFIGURATION),)
stop:
	$(error You MUST call 'configure' first.)
endif 

#======================================================================
# Build Environment (Don't edit these configurations)
#======================================================================
export TARGET := raspbian

UNAMEM := $(shell uname -m)
ifeq ($(UNAMEM), armv7l)
export ARCH := pi2
else
export ARCH := pi1
endif

export HOST := linux
export CP := cp
export RM := rm
export MD := mkdir

export BUILD_MODE := $(CONFIGURATION)
export ABS_BUILD_DIR := $(shell pwd)
export ABS_BUILD_ROOT := $(ABS_BUILD_DIR)/..
export ABS_SRC_ROOT := $(ABS_BUILD_ROOT)/../src
export REL_OUTPUT_DIR := raspbian-output

ifeq ($(J),)
ifeq ($(MAKECMDGOALS), clean)
JOBS := 1
else
JOBS := 4
endif
else
JOBS := $(J)
endif
#======================================================================

.PHONY: all config purge

all: make_alone

config:
	@echo "config_linux.h => config.h"
	@cp -pf $(ABS_SRC_ROOT)/00_config/config/config_linux.h $(ABS_SRC_ROOT)/00_config/config/config.h

purge:
	@echo "Purge output files"
	@rm -rf $(REL_OUTPUT_DIR)

ifneq ($(MAKECMDGOALS), all)
ifneq ($(MAKECMDGOALS), config)
ifneq ($(MAKECMDGOALS), purge)
$(MAKECMDGOALS): make_alone
endif
endif
endif

make_alone:
	@make --no-print-directory -j $(JOBS) -f $(MAKEFILE) $(MAKECMDGOALS)
