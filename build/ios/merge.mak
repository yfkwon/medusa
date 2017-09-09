#======================================================================
include ../../projects/project_merge.mak
#======================================================================

merge:
	@echo "Merge to lib$(LIB_NAME).a ($(ARCH))"
	@$(RM) -rf $(REL_OUTPUT_DIR)/merge/$(ARCH)
	@$(MD) -p $(REL_OUTPUT_DIR)/merge/$(ARCH)
	@$(AR) -static -arch_only $(ARCH) -o $(REL_OUTPUT_DIR)/merge/$(ARCH)/lib$(LIB_NAME).a $(REL_OUTLIB_DIR)/*.a
	@echo "Done."
