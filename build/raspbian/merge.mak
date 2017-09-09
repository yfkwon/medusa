#======================================================================
include ../../projects/project_merge.mak
#======================================================================

STATIC_LIBS := $(wildcard $(REL_OUTLIB_DIR)/*.a)
merge:
	@echo "Merge to lib$(LIB_NAME).a"
	@$(RM) -rf $(REL_OUTPUT_DIR)/merge
	@$(MD) -p $(REL_OUTPUT_DIR)/merge
	@echo "CREATE $(REL_OUTPUT_DIR)/merge/lib$(LIB_NAME).a" > $(REL_OUTPUT_DIR)/merge/script.ar
	@for a in $(STATIC_LIBS); do (echo "ADDLIB $$a" >> $(REL_OUTPUT_DIR)/merge/script.ar); done
	@echo "SAVE" >> $(REL_OUTPUT_DIR)/merge/script.ar
	@echo "END" >> $(REL_OUTPUT_DIR)/merge/script.ar
	@$(AR) -M < $(REL_OUTPUT_DIR)/merge/script.ar
	@$(RM) -f $(REL_OUTPUT_DIR)/merge/script.ar
	@echo "Done."
