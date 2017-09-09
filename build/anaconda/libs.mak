libs: version pal mem base stack engine api wrapper

version:
ifneq ($(GOAL), clean)
	@sh $(ABS_SRC_ROOT)/00_config/version/version_modify.sh
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


stack: sturn tls websocket

sturn:
	@$(MAKE) -C $(ABS_SRC_ROOT)/04_stack/sturn -f Makefile.proj $(GOAL)

tls:
	@$(MAKE) -C $(ABS_SRC_ROOT)/04_stack/tls -f Makefile.proj $(GOAL)

websocket:
	@$(MAKE) -C $(ABS_SRC_ROOT)/04_stack/websocket -f Makefile.proj $(GOAL)


engine: nice nice_desc nscp_desc cam_info_provider uc_signaler surv_engine

nice:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nice -f Makefile.proj $(GOAL)

nice_desc:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nice_desc -f Makefile.proj $(GOAL)

nscp_desc:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/nscp_desc -f Makefile.proj $(GOAL)
 
cam_info_provider:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/camInfoProvider -f Makefile.proj $(GOAL)

uc_signaler:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/uc_signaler -f Makefile.proj $(GOAL)

surv_engine:
	@$(MAKE) -C $(ABS_SRC_ROOT)/05_engine/surveillance_device_engine -f Makefile.proj $(GOAL)

api: surv_api

surv_api:
	@$(MAKE) -C $(ABS_SRC_ROOT)/06_api/nxSurveillanceDeviceEngine -f Makefile.proj $(GOAL)

wrapper:

