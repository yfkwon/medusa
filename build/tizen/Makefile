SHELL = /bin/bash
MAKEFILE := Makefile_tizen

ifeq ($(CONFIGURATION),)
stop:
	$(error You MUST call 'configure' first.)
endif 

#======================================================================
# Build Environment (Don't edit these configurations)
#======================================================================
export TARGET := tizen
UNAME := $(shell uname -s)
HOST := linux
ifneq (,$(findstring CYGWIN,$(UNAME)))
HOST := cygwin
else
ifneq (,$(findstring Darwin,$(UNAME)))
HOST := darwin
endif
endif
export HOST
export CP := cp
export RM := rm
export MD := mkdir

export BUILD_MODE := $(CONFIGURATION)
export ABS_BUILD_DIR := $(shell pwd)
export ABS_BUILD_ROOT := $(ABS_BUILD_DIR)/..
export ABS_SRC_ROOT := $(ABS_BUILD_ROOT)/../src
export REL_OUTPUT_DIR := tizen-output

ifeq ($(J),)
JOBS := 4
ifeq ($(MAKECMDGOALS), clean)
JOBS := 1
endif
ifeq ($(MAKECMDGOALS), so)
JOBS := 1
endif
else
JOBS := $(J)
endif

#----------------------------------------------------------------------
# Path for NDK link
#----------------------------------------------------------------------
ABS_OUTLIB_DIR := $(ABS_BUILD_DIR)/$(REL_OUTPUT_DIR)/merge
ifeq ($(HOST),cygwin)
ABS_OUTLIB_DIR := $(shell echo $(ABS_OUTLIB_DIR) | sed -e 's,^/cygdrive/\([a-z]\)\(.*\),\1:\2,')
endif

export ABS_OUTLIB_DIR
#======================================================================

.PHONY: all config purge

ll: make_alone

config:
	@echo "config_linux.h => config.h"
	@cp -pf $(ABS_SRC_ROOT)/00_config/config/config_tizen.h $(ABS_SRC_ROOT)/00_config/config/config.h

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

