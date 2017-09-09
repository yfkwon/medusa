SHELL = /bin/bash

ifeq ($(CONFIGURATION),)
stop:
	$(error You MUST call 'configure' first.)
endif 

CCACHE := $(shell type -P ccache 2>/dev/null)

GOAL := all
ifeq ($(MAKECMDGOALS), clean)
GOAL := clean
endif

#======================================================================
# Build Environment (Don't edit these configurations)
#======================================================================
export TARGET := linux
export HOST := anaconda
export CP := cp
export RM := rm
export MD := mkdir

export BUILD_MODE := $(CONFIGURATION)

export REL_OUTPUT_DIR := linux-output
export REL_OUTLIB_DIR := $(REL_OUTPUT_DIR)/$(BUILD_MODE)

export ABS_BUILD_DIR := $(shell pwd)
export ABS_BUILD_ROOT := $(ABS_BUILD_DIR)/..
export ABS_SRC_ROOT := $(ABS_BUILD_ROOT)/../src

#======================================================================
# Toolchain setting
#======================================================================
MAKE := make --no-print-directory
export CC := $(CCACHE) i686-cm-linux-gcc
export CXX := $(CCACHE) i686-cm-linux-g++
export AR := i686-cm-linux-ar

#----------------------------------------------------------------------
# compiler flags
#----------------------------------------------------------------------
CFLAGS := -fpic -finline-limit=300 -D_REENTRANT -MP -MMD \
		-Wall \
		-Winit-self \
		-Wdeprecated-declarations
		
ifeq ($(V), 1)
CFLAGS += -Wextra -Wsign-conversion
else
CFLAGS += -Wsign-compare
endif

CFLAGS += -Wno-unused-parameter

ifeq ($(BUILD_MODE), debug)
CFLAGS += -D_DEBUG -O0 -g
else
CFLAGS += -DNDEBUG -O2 -Os
endif

CXXFLAGS :=	-Winvalid-offsetof -Wno-reorder -I$(HUMAX_TOOLCHAIN)/include

export CXXFLAGS
export CFLAGS

#----------------------------------------------------------------------
# archive flags
#----------------------------------------------------------------------
export ARFLAGS := cr


#======================================================================
# Make the Projects
#======================================================================
.PHONY: all clean config delete purge start_tick end_tick

#all: start_tick project_def libs end_tick
all:
	@$(MAKE) start_tick
ifeq ($(J),)
	@$(MAKE) -j 4 libs
else
	@$(MAKE) -j $(J) libs
endif
	@$(MAKE) project_def
	@$(MAKE) end_tick

clean: project_def libs

#######################################################################

config:
	@$(CP) -pf $(ABS_SRC_ROOT)/00_config/config/config_linux.h $(ABS_SRC_ROOT)/00_config/config/config.h

#######################################################################

delete:
	@$(RM) -rf $(REL_OUTLIB_DIR)

purge:
	@$(RM) -rf $(REL_OUTPUT_DIR)

#######################################################################

start_tick:
	@echo " "
	@echo " "
	@echo "================================================="
	@echo -n "Build ($(CONFIGURATION)) started at "
	@date '+%F %r'
	@echo "================================================="
	@echo " "
	@echo " "
	@sh ../time_calculation.sh 0

end_tick:
	@echo " "
	@echo " "
	@echo "==================================================="
	@echo -n "Build ($(CONFIGURATION)) completed at "
	@date '+%F %r'
	@echo "==================================================="
	@echo " "
	@echo " "
	@sh ../time_calculation.sh 1

#======================================================================
PROJECT_LIBS := ../../projects/project_libs.mak

include ../../projects/project_def.mak
ifneq ($(wildcard $(PROJECT_LIBS)), )
include $(PROJECT_LIBS)
else
include libs.mak
endif
include deploy.mak
#======================================================================

