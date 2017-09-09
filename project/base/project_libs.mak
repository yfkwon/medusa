LIB_NAME := libBase.a

project_libs: base stack engine third_party

base: base_log base_file base_net base_util

base_log:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/log -f Makefile.proj $(GOAL)

base_file:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/file -f Makefile.proj $(GOAL)

base_net:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/net -f Makefile.proj $(GOAL)

base_util:
	@$(MAKE) -C $(ABS_SRC_ROOT)/03_base/util -f Makefile.proj $(GOAL)


stack: json tls http dronelink thread_socket thread_loop i2c serial environment ntlc_lookup transport_manager

json:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/json -f Makefile.proj $(GOAL)

tls:
	@$(MAKE) -C $(ABS_SRC_ROOT)/04_stack/tls -f Makefile.proj $(GOAL)

http:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/http -f Makefile.proj $(GOAL)

dronelink:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/dronelink -f Makefile.proj $(GOAL)

thread_loop:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/thread_loop -f Makefile.proj $(GOAL)

i2c:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/i2c -f Makefile.proj $(GOAL)

serial:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/serial -f Makefile.proj $(GOAL)

thread_socket:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/thread_socket -f Makefile.proj $(GOAL)

environment:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/environment -f Makefile.proj $(GOAL)

ntlc_lookup:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/ntlc_lookup -f Makefile.proj $(GOAL)

transport_manager:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/04_stack/transport_manager -f Makefile.proj $(GOAL)

engine: drone_register drone_registrar fcc_engine iot_engine provision_engine lte_engine d2d_engine drone_app

drone_register:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/drone_register -f Makefile.proj $(GOAL)

drone_registrar:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/drone_registrar -f Makefile.proj $(GOAL)

fcc_engine:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/fcc_engine -f Makefile.proj $(GOAL)

iot_engine:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/iot_engine_ex -f Makefile.proj $(GOAL)

provision_engine:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/provision_engine -f Makefile.proj $(GOAL)

lte_engine:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/lte_engine -f Makefile.proj $(GOAL)

d2d_engine:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/05_engine/d2d_engine -f Makefile.proj $(GOAL)

drone_app:
	@$(MAKE) -C  $(ABS_SRC_ROOT)/07_application/drone_app -f Makefile.proj $(GOAL)



third_party:
ifneq ($(GOAL), clean)
	@echo "Skip.. third_party"

else
	@cd ../../third_party/miniupnpc && \
	sh ./genMakefiles $(HOST) && \
	$(MAKE) clean
	@cd ../../third_party/libnatpmp && \
	$(MAKE) -f Makefile_iris clean
endif
	@echo "copy bluetooth library"
	@cp -pf $(ABS_BUILD_ROOT)/../third_party/libbt/LibBT/libbt.a $(REL_OUTLIB_DIR)