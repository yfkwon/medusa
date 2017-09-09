SHELL = /bin/bash
MAKEFILE := Makefile_osx

ifeq ($(CONFIGURATION),)
stop:
	$(error You MUST call 'configure' first.)
endif 

#======================================================================
include ../../projects/project_merge.mak
#======================================================================

#======================================================================
# Build Environment (Don't edit these configurations)
#======================================================================
export TARGET := osx
export HOST := darwin
export CP := cp
export RM := rm
export MD := mkdir

export BUILD_MODE := $(CONFIGURATION)
export ABS_BUILD_DIR := $(shell pwd)
export ABS_BUILD_ROOT := $(ABS_BUILD_DIR)/..
export ABS_SRC_ROOT := $(ABS_BUILD_ROOT)/../src
export REL_OUTPUT_DIR := osx-output

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

all: make_loop

config:
	@echo "config_osx.h => config.h"
	@$(CP) -pf $(ABS_SRC_ROOT)/00_config/config/config_osx.h $(ABS_SRC_ROOT)/00_config/config/config.h

purge:
	@echo "Purge output files"
	@$(RM) -rf $(REL_OUTPUT_DIR)

ifneq ($(MAKECMDGOALS), all)
ifneq ($(MAKECMDGOALS), config)
ifneq ($(MAKECMDGOALS), purge)
$(MAKECMDGOALS): make_loop
ifeq ($(MAKECMDGOALS), merge)
ifeq ("$(ARCHS)", "x86_64 i386")
	@rm -rf ./osx-output/merge/universal
	@mkdir -p ./osx-output/merge/universal
	@echo "Merge to lib$(LIB_NAME).a (universal)"
	@libtool -static \
		./osx-output/merge/x86_64/lib$(LIB_NAME).a \
		./osx-output/merge/i386/lib$(LIB_NAME).a \
		-o ./osx-output/merge/universal/lib$(LIB_NAME).a
	@echo "Done."
endif
endif
endif
endif
endif

make_loop:
	@for ARCH in $(ARCHS); do \
		export ARCH; \
		make --no-print-directory -j $(JOBS) -f $(MAKEFILE) $(MAKECMDGOALS); \
	done
