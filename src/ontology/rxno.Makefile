## Customize Makefile settings for rxno
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

## Module for ontology: bfo

$(IMPORTDIR)/bfo_import.owl: $(IMPORTDIR)/bfo_terms.txt $(IMPORTSEED) | all_robot_plugins
	$(ROBOT) annotate --input $(MIRRORDIR)/bfo.owl --remove-annotations \
		 odk:normalize --add-source true \
		 extract --term-file $(IMPORTDIR)/bfo_terms.txt $(T_IMPORTSEED) \
		         --force true --copy-ontology-annotations true \
		         --individuals exclude \
		         --method BOT \
		 remove -T $(IMPORTDIR)/bfo_remove_list.txt --select "self descendants instances" --signature true \
		 odk:normalize --base-iri http://purl.obolibrary.org/obo/bfo.owl \
                --subset-decls true --synonym-decls true \
         repair --merge-axiom-annotations true \
         $(ANNOTATE_CONVERT_FILE)


## Module for ontology: chebi

$(IMPORTDIR)/chebi_import.owl: $(IMPORTDIR)/chebi_terms.txt $(IMPORTSEED) | all_robot_plugins
	if [ $(IMP) = true ] && [ $(IMP_LARGE) = true ]; then $(ROBOT) \
	annotate --input $(MIRRORDIR)/chebi.owl --remove-annotations \
		 odk:normalize --add-source true \
		 extract --term-file $(IMPORTDIR)/chebi_terms.txt $(T_IMPORTSEED) \
		         --force true --copy-ontology-annotations true \
		         --individuals exclude \
		         --method BOT \
		 remove -T $(IMPORTDIR)/chebi_remove_list.txt --select "self descendants instances" \
		 remove $(foreach p, $(ANNOTATION_PROPERTIES), --term $(p)) \
		        --term-file $(IMPORTDIR)/chebi_terms.txt $(T_IMPORTSEED) \
		        --select complement --select annotation-properties \
		 odk:normalize --base-iri http://purl.obolibrary.org/obo/chebi.owl \
                --subset-decls true --synonym-decls true \
         repair --merge-axiom-annotations true \
         $(ANNOTATE_CONVERT_FILE); fi 

## Module for ontology: obi

$(IMPORTDIR)/obi_import.owl: $(IMPORTDIR)/obi_terms.txt $(IMPORTSEED) | all_robot_plugins
	if [ $(IMP) = true ] && [ $(IMP_LARGE) = true ]; then $(ROBOT) \
	annotate --input $(MIRRORDIR)/obi.owl --remove-annotations \
		 odk:normalize --add-source true \
		 extract --term-file $(IMPORTDIR)/obi_terms.txt $(T_IMPORTSEED) \
		         --force true --copy-ontology-annotations true \
		         --individuals exclude \
		         --method BOT \
		 remove -T $(IMPORTDIR)/obi_remove_list.txt --select "self descendants instances" --signature true \
		 remove $(foreach p, $(ANNOTATION_PROPERTIES), --term $(p)) \
		        --term-file $(IMPORTDIR)/obi_terms.txt $(T_IMPORTSEED) \
		        --select complement --select annotation-properties \
		 odk:normalize --base-iri http://purl.obolibrary.org/obo/obi.owl \
                --subset-decls true --synonym-decls true \
         repair --merge-axiom-annotations true \
         $(ANNOTATE_CONVERT_FILE); fi 

## Module for ontology: iao
# This is basically the default SLME-BOT code from ODK with an additional 
# remove steps. This second remove step removes currently unused IAO terms,
# which would otherwise be pulled in by the ROBOT extract step.

$(IMPORTDIR)/iao_import.owl: $(IMPORTDIR)/iao_terms.txt $(IMPORTSEED) | all_robot_plugins
	if [ $(IMP) = true ]; then $(ROBOT) annotate --input $(MIRRORDIR)/iao.owl --remove-annotations \
		 odk:normalize --add-source true \
		 extract --term-file $(IMPORTDIR)/iao_terms.txt $(T_IMPORTSEED) \
		         --force true --copy-ontology-annotations true \
		         --individuals exclude \
		         --method BOT \
		 remove $(foreach p, $(ANNOTATION_PROPERTIES), --term $(p)) \
		        --term-file $(IMPORTDIR)/iao_terms.txt $(T_IMPORTSEED) \
		        --select complement --select annotation-properties \
		 remove -T $(IMPORTDIR)/iao_remove_list.txt --select "self descendants instances" --signature true \
		 odk:normalize --base-iri http://purl.obolibrary.org/obo/iao.owl \
		               --subset-decls true --synonym-decls true \
		 repair --merge-axiom-annotations true \
		 $(ANNOTATE_CONVERT_FILE); fi 