LIB_NAME := libnXerICEEngine.a
STATIC_LIBS := $(wildcard $(REL_OUTLIB_DIR)/*.a)

deploy:
	@echo "Merge to $(LIB_NAME)"
	@$(RM) -rf $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE) 
	@$(MD) -p $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)
	@echo "CREATE $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/$(LIB_NAME)" > $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar
	@for a in $(STATIC_LIBS); do (echo "ADDLIB $$a" >> $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar); done
	@echo "SAVE" >> $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar
	@echo "END" >> $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar
	@$(AR) -M < $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar
	@$(RM) -f $(REL_OUTPUT_DIR)/deploy/$(BUILD_MODE)/script.ar
	@echo "Done."
