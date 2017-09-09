libs: version pal mem base stack engine api wrapper

version:
ifneq ($(GOAL), clean)
ifeq ($(HOST), darwin)
	@sh $(ABS_SRC_ROOT)/00_config/version/version_modify_mac.sh
else
	@sh $(ABS_SRC_ROOT)/00_config/version/version_modify.sh
endif
endif
	@$(MAKE) -C $(ABS_SRC_ROOT)/00_config/version -f Makefile.proj $(GOAL)

pal:
	@$(MAKE) -C $(ABS_SRC_ROOT)/01_pal/pal -f Makefile.proj $(GOAL)

mem:
	@$(MAKE) -C $(ABS_SRC_ROOT)/02_mem/mem -f Makefile.proj $(GOAL)


base: base_log base_file base_net base_util

base_log:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/log -f Makefile.proj $(GOAL)

base_file:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/file -f Makefile.proj $(GOAL)

base_net:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/net -f Makefile.proj $(GOAL)

base_util:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/util -f Makefile.proj $(GOAL)


stack: sturn 

sturn:
	@$(MAKE) -C $(ABS_SRC_ROOT)/04_stack/sturn -f Makefile.proj $(GOAL)	

engine: nice nice_desc nice_engine

nice:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nice -f Makefile.proj $(GOAL)

nice_desc:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nice_desc -f Makefile.proj $(GOAL)
	
nice_engine:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nice_engine -f Makefile.proj $(GOAL)


api :nice_api

nice_api:
	@$(MAKE) -C $(ABS_SRC_ROOT)/06_api/nxNiceEngine -f Makefile.proj $(GOAL)


wrapper:


