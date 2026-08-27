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

## Module for ontology: ro

$(IMPORTDIR)/ro_import.owl: $(MIRRORDIR)/ro.owl $(IMPORTDIR)/ro_terms.txt $(IMPORTSEED) | all_robot_plugins
	$(ROBOT) annotate --input $< --remove-annotations \
		 odk:normalize --add-source true \
		 extract --term-file $(IMPORTDIR)/ro_terms.txt $(T_IMPORTSEED) \
		         --force true --copy-ontology-annotations true \
		         --individuals exclude \
		         --method BOT \
		 remove $(foreach p, $(ANNOTATION_PROPERTIES), --term $(p)) \
		        --term-file $(IMPORTDIR)/ro_terms.txt $(T_IMPORTSEED) \
		        --select complement --select annotation-properties \
		 odk:normalize --base-iri http://purl.obolibrary.org/obo/ro.owl \
                --subset-decls true --synonym-decls true \
         repair --merge-axiom-annotations true \
         $(ANNOTATE_CONVERT_FILE)