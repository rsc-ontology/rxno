## Customize Makefile settings for rxno
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

## Module for ontology: bfo

$(IMPORTDIR)/bfo_import.owl: $(MIRRORDIR)/bfo.owl $(IMPORTDIR)/bfo_remove_list.txt | all_robot_plugins
	if [ $(IMP) = true ] && [ $(IMP_LARGE) = true ]; then $(ROBOT) \
		remove --input $(MIRRORDIR)/bfo.owl -T $(IMPORTDIR)/bfo_remove_list.txt --select "self descendants instances" \
		odk:normalize --base-iri http://purl.obolibrary.org/obo/bfo.owl \
			--subset-decls true --synonym-decls true \
		repair --merge-axiom-annotations true \
		$(ANNOTATE_CONVERT_FILE) ; fi