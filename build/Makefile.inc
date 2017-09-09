SHELL = /bin/sh

#================================================
# target file name define.
# default : lib
#================================================
TARGET_FILE := lib$(PROJECT_NAME).a

#================================================
# Output paths
#================================================
OBJDIR := $(REL_OUTLIB_DIR)
OUTDIR := $(ABS_BUILD_DIR)/$(REL_OUTLIB_DIR)

#================================================
# Search paths
#================================================
INCLUDE := -I. $(PROJECT_INC)

#================================================
# Prerequisites
#================================================
ifeq ($(COBJXX),)
SRCS := $(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.c $(dir)/*.cpp))
OBJS := $(patsubst %.cpp,$(OBJDIR)/%.o,$(patsubst %.c,$(OBJDIR)/%.o,$(SRCS)))
else
SRCS := $(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.c $(dir)/*.cpp $(dir)/*.mm))
OBJS := $(patsubst %.mm,$(OBJDIR)/%.o,$(patsubst %.cpp,$(OBJDIR)/%.o,$(patsubst %.c,$(OBJDIR)/%.o,$(SRCS))))
endif

#================================================
# Dependency
#================================================
ifeq ($(MAKECMDGOALS), all)
-include $(OBJS:.o=.d)
endif

#================================================
# Root targets
#================================================
all: $(OUTDIR)/$(TARGET_FILE)
clean:
	@echo [CLEAN] $(PROJECT_NAME)
	@$(RM) -rf $(OBJDIR)
	@$(RM) -f $(OUTDIR)/$(TARGET_FILE)

#================================================
# Deployment rules
#================================================
$(OUTDIR)/$(TARGET_FILE): $(OBJDIR)/$(TARGET_FILE)
	@$(MD) -p $(OUTDIR)
	@$(CP) $< $@

#================================================
# Build rules
#================================================

$(OBJDIR)/$(TARGET_FILE): $(OBJS)
	@echo
ifeq ($(AR), libtool)
	$(AR) $(ARFLAGS) $^ -o $@
else
	$(AR) $(ARFLAGS) $@ $^
endif
	@echo
ifeq ($(BUILD_MODE), release)
	$(STRIP) $(STRIPFLAGS) $@
endif

$(OBJDIR)/%.o: %.c
	@$(MD) -p $(dir $@)
ifeq ($(V), 1)
	$(CC) -c $(INCLUDE) $(CFLAGS) $(PROJECT_DEFINES) $< -o $@
else
	@echo [COMPILE] $<
	@$(CC) -c $(INCLUDE) $(CFLAGS) $(PROJECT_DEFINES) $< -o $@
endif

$(OBJDIR)/%.o: %.cpp
	@$(MD) -p $(dir $@)
ifeq ($(V), 1)
	$(CXX) -c $(INCLUDE) $(CFLAGS) $(CXXFLAGS) $(PROJECT_DEFINES) $< -o $@
else
	@echo [COMPILE] $<
	@$(CXX) -c $(INCLUDE) $(CFLAGS) $(CXXFLAGS) $(PROJECT_DEFINES) $< -o $@
endif

$(OBJDIR)/%.o: %.mm
	@$(MD) -p $(dir $@)
ifeq ($(V), 1)
	$(COBJXX) -c $(INCLUDE) $(CFLAGS) $(CXXFLAGS) $(PROJECT_DEFINES) $< -o $@
else
	@echo [COMPILE] $<
	@$(COBJXX) -c $(INCLUDE) $(CFLAGS) $(CXXFLAGS) $(PROJECT_DEFINES) $< -o $@
endif
