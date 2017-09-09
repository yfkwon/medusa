#======================================================================
include ../../projects/project_merge.mak
#======================================================================

STATIC_LIBS := $(wildcard $(REL_OUTLIB_DIR)/*.a)
merge:
	@echo "Merge to lib$(LIB_NAME).a ($(ARCH))"
	@$(RM) -rf $(REL_OUTPUT_DIR)/merge/$(ARCH)
	@$(MD) -p $(REL_OUTPUT_DIR)/merge/$(ARCH)
	@echo "CREATE $(REL_OUTPUT_DIR)/merge/$(ARCH)/lib$(LIB_NAME).a" > $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar
	@for a in $(STATIC_LIBS); do (echo "ADDLIB $$a" >> $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar); done
	@echo "SAVE" >> $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar
	@echo "END" >> $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar
	@$(AR) -M < $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar
	@$(RM) -f $(REL_OUTPUT_DIR)/merge/$(ARCH)/script.ar
	@echo "Done."
