# Systematic Comparison of RXNO Classes Before and After the ODK Migration
[author](http://purl.org/dc/terms/creator): [Philip Strömert](https://orcid.org/0000-0002-1595-3213) | [author](http://purl.org/dc/terms/creator): [Noura Rayya](https://orcid.org/0009-0001-5998-5030) | [created on](http://purl.org/dc/terms/created): 06.10.2026

## Background
Before the migration to an Ontology Development Kit (ODK) based workflow, the two ontologies RXNO and MOP where maintained within the same GitHub repository: https://github.com/rsc-ontology/rxno. Their release workflow was such that edits were directly made to the release files `rxno.owl`and `mop.owl` respectively. So these two files where the only source of truth/origin for both ontologies, compared to an ODK based workflow, where release files are being generated automatically from a separate editor OWl file and/or different component files, such as OWL files and/or ROBOT TSV files.

In 2021, as a result of the [Ontologies4Chem: the landscape of ontologies in chemistry](https://doi.org/10.1515/pac-2021-2007) overview paper, the NFDI4Chem team started to improve both ontologies by filing issues and pull requests in this single RXNO repository. One of the first suggestions was to properly import MOP in RXNO using `owl:import` instead of (re)defining the MOP classes within the `rxno.owl` file (see [issue #27](https://github.com/rsc-ontology/rxno/issues/27)). 


## Creating and Archiving a Pre-ODK Release of RXNO and MOP
Before the migration to ODK, both ontologies were only published directly in the code base of the GitHub repository. No GitHub release were ever created. Thus, we created a pre-ODK release and tag to allow pointing to these versions of RXNO and MOP, see: https://github.com/rsc-ontology/rxno/tree/pre-odk-release


## Comparison Workflow of RXNO Classes Before and After the ODK Migration

1. Generate the post-ODK rxno.owl by running 
  ```shell
  make prepare_release
  ```
2. Download the pre-ODK RXNO
    ```shell
    curl -o rxno_pre_odk.owl https://raw.githubusercontent.com/rsc-ontology/rxno/refs/tags/pre-odk-release/rxno.owl && \
    ```
3. Copy the rxno.owl file to the folder odk-diff and rename the file to rxno_pre_odk.owl
4. Use the RXNO files created in steps 2 and 3 in ROBOT, to produce an ontology in functional syntax that only contains the RXNO classes and only references all external ontology terms via their PURL:
    ```shell
    robot remove -i rxno_pre_odk.owl --base-iri RXNO --exclude-term owl:versionIRI --axioms external --preserve-structure false --trim false -o rxno_base_pre_odk.owl && \
    robot remove -i rxno_post_odk.owl --base-iri RXNO --exclude-term owl:versionIRI --axioms external --preserve-structure false --trim false -o rxno_base_post_odk.owl
    ```
4. Make an html diff to see the changes of RXNO classes in RXNO before and after ODK migration
    ```shell
    robot diff --left rxno_base_pre_odk.owl --right rxno_base_post_odk.owl -f html -o rxno_pre_vs_post_odk_diff.html
    ```
5. Make another md diff to host comments clarifying the changes of classes in RXNO before and after ODK migration
    ```shell
    robot diff --left rxno_base_pre_odk.owl --right rxno_base_post_odk.owl -f pretty -o rxno_pre_vs_post_odk_diff.md
    ```
