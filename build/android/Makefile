SHELL = /bin/bash
MAKEFILE := Makefile_android

ifeq ($(CONFIGURATION),)
stop:
	$(error You MUST call 'configure' first.)
endif 

#======================================================================
# Build Environment (Don't edit these configurations)
#======================================================================
export TARGET := android
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
export REL_OUTPUT_DIR := android-output

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

all: make_loop

config:
	@echo "config_android.h => config.h"
	@$(CP) -pf $(ABS_SRC_ROOT)/00_config/config/config_android.h $(ABS_SRC_ROOT)/00_config/config/config.h

purge:
	@echo "Purge output files"
	@$(RM) -rf $(REL_OUTPUT_DIR)

ifneq ($(MAKECMDGOALS), all)
ifneq ($(MAKECMDGOALS), config)
ifneq ($(MAKECMDGOALS), purge)
$(MAKECMDGOALS): make_loop
endif
endif
endif

make_loop:
	@for ARCH in $(ARCHS); do \
		export ARCH; \
		make --no-print-directory -j $(JOBS) -f $(MAKEFILE) $(MAKECMDGOALS); \
	done
