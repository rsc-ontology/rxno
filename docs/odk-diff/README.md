# Systematic Comparison of RXNO Before and After the ODK Migration
[author](http://purl.org/dc/terms/creator): [Philip Strömert](https://orcid.org/0000-0002-1595-3213) | [author](http://purl.org/dc/terms/creator): [Noura Rayya](https://orcid.org/0009-0001-5998-5030) | [created on](http://purl.org/dc/terms/created): 06.10.2026

## Pre-ODK Migration Background
Before the migration to an Ontology Development Kit (ODK) based workflow, the two ontologies RXNO and MOP were maintained within the same GitHub repository: https://github.com/rsc-ontology/rxno. Their release workflow relied on editing the release files `rxno.owl`and `mop.owl` directly in Protégé and then converting them to OBO format with ROBOT. Hence, these files were the source of truth for both ontologies, which is in contrast to an ODK-based workflow, where release files in different serialisation formats are generated automatically from a separate editor OWL file and/or component files (OWL files and/or ROBOT TSV files).

In 2021, as a result of the [Ontologies4Chem: the landscape of ontologies in chemistry](https://doi.org/10.1515/pac-2021-2007) overview paper, the NFDI4Chem team began improving both ontologies by filing issues and pull requests in this single RXNO repository. One of the first suggestions was to properly import MOP into RXNO using `owl:import` instead of (re)defining the MOP classes within the `rxno.owl` file (see [issue #27](https://github.com/rsc-ontology/rxno/issues/27)). While trying to resolve this issue in 2022, more issues were identified in the MOP side, which are described in more detail in the [MOP ODK migration documentation](https://rsc-ontology.github.io/mop/odk-diff/#pre-odk-migration-background).

## ODK Migration Background
All issues preventing a proper import of MOP into RXNO have since been resolved with the migration of RXNO and MOP  to ODK-based repositories. As part of this, all RXNO terms and axioms defined in the pre-ODK RXNO release version were copied into the ODK-based [RXNO editor file](https://github.com/rsc-ontology/rxno/blob/main/src/ontology/rxno-edit.owl), from which different release artifacts were then generated automatically with standard ODK commands.

## Creating and Archiving a Pre-ODK Release of RXNO and MOP
Before the migration to ODK, both ontologies were published only directly in the GitHub repository's code base; no GitHub releases had ever been created. We therefore created a pre-ODK release and tag so that these versions of RXNO and MOP could be referenced properly: https://github.com/rsc-ontology/rxno/tree/pre-odk-release .


## Creating ROBOT diff Comparing RXNO Before and After the ODK Migration
We used [ROBOT](https://robot.obolibrary.org/) to generate a diff between the pre and post ODK RXNO release versions, to make sure the ODK migration did not produce any unaccounted changes of RXNO. These are the steps and commands we used for generating this diff:

1. Download the pre-ODK RXNO file [rxno_pre_odk.owl](docs\odk-diff\rxno_pre_odk.owl)
    ```shell
    curl -o rxno_pre_odk.owl https://raw.githubusercontent.com/rsc-ontology/rxno/refs/tags/pre-odk-release/rxno.owl
    ```
2. Generate a base release from the previously downloaded pre-ODK RXNO version [rxno_base_pre_odk.owl](docs\odk-diff\rxno_base_pre_odk.owl) that only contains the RXNO classes and just references all external ontology terms via their PURL:
    ```shell
    robot remove -i rxno_pre_odk.owl --base-iri RXNO --exclude-term owl:versionIRI --axioms external --preserve-structure false --trim false -o rxno_base_pre_odk.owl
    ```
    This step is necessary to produce a slimmer diff later, as it excludes any axioms and annotations asserted on imported external terms. 

3. Download the base release of the post-ODK RXNO version [rxno_base_post_odk.owl](docs\odk-diff\rxno_base_post_odk.owl)
    ```shell
     curl -o rxno_base_post_odk.owl https://raw.githubusercontent.com/rsc-ontology/rxno/refs/tags/v2026-10-29/rxno-base.owl
     ```
4. Produce the diff to see the changes after the ODK migration in HTML ([rxno_pre_vs_post_odk_diff.html](docs\odk-diff\rxno_pre_vs_post_odk_diff.html)) and Markdown format ([rxno_pre_vs_post_odk_diff.md](docs\odk-diff\rxno_pre_vs_post_odk_diff.md)): 
    ```shell
    robot diff --left rxno_base_pre_odk.owl --right rxno_base_post_odk.owl  \
          -f html -o rxno_pre_vs_post_odk_diff.html &&
    robot diff --left rxno_base_pre_odk.owl --right rxno_base_post_odk.owl  \
          -f markdown -o rxno_pre_vs_post_odk_diff.md
    ```
## Analysing ROBOT diff Comparing RXNO Before and After the ODK Migration
### Pipeline Artifact
#### Removal or Addition of External Terms 

**Cause:** The diff compares two OWL files that each contain only the axioms relevant to RXNO terms. An external term (from BFO, COB, IAO, MOP, OBI, RO, etc.) is declared in one file but not the other depending on whether it is referenced in an axiom on a RXNO term *in that specific file*. 

**Action:** Ignore. The *axiom* difference is the semantic issue (covered under **Semantic Changes** below); the *presence of the external term declaration* is a pipeline artifact associated with the OWL syntax.

**Removed external terms (11):** `BFO_0000057`, `BFO_0000077`, `BFO_0000078`, `MOP_0000713`, `MOP_0000714`, `MOP_0000715`, `OBI_0000011`, `http://purl.org/dc/elements/1.1/creator`, `http://purl.org/dc/elements/1.1/date`, `http://purl.org/dc/elements/1.1/description`, `http://purl.org/dc/elements/1.1/title` 


**Added external terms (17):** `COB_0000035`, `COB_0000082`, `MOP_0000591`, `MOP_0000629`, `MOP_0000708`, `MOP_0006370`, `MOP_0006371`, `RO_0000057`, `RO_0004008`, `RO_0004009`, `http://purl.org/dc/terms/contributor`, `http://purl.org/dc/terms/creator`, `http://purl.org/dc/terms/date`, `http://purl.org/dc/terms/description`, `http://purl.org/dc/terms/title`, `http://purl.org/dc/elements/1.1/type`


#### Deletion of Inherited SubClassOf Axioms
**Cause:**
Because we compare release versions, the file generated automatically by ODK from the RXNO editor file differs from the pre‑ODK one, owing to the [ROBOT reduce](https://robot.obolibrary.org/reduce) step in the ODK release build pipeline. For example if an axiom is asserted on an RXNO term in the editor file (e.g., `'has specified product' some olefin` on `'Horner reaction'`) but the same axiom is already present on the parent of this term (e.g., `olefination`), the ROBOT reduce step will delete this axiom from the child, as it is already inherited by the parent (see 'Horner reaction' in the RXNO release versus the editor file.) 

**Action:**
TODO: Delete these redundant axioms from the terms in the RXNO editor file ([issue #76](https://github.com/rsc-ontology/rxno/issues/76))

**Affected terms (56):**

- Bartoli indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000494`
- Barton-Zard reaction `http://purl.obolibrary.org/obo/RXNO_0000496`
- Bergmann degradation `http://purl.obolibrary.org/obo/RXNO_0000516`
- Bernthsen acridine synthesis `http://purl.obolibrary.org/obo/RXNO_0000519`
- Bischler-Möhlau indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000523`
- Boc protection `http://purl.obolibrary.org/obo/RXNO_0000079`
- Borsche-Drechsel cyclisation `http://purl.obolibrary.org/obo/RXNO_0000532`
- Cadogan carbazole synthesis `http://purl.obolibrary.org/obo/RXNO_0000252`
- Cadogan indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000509`
- Camps quinoline synthesis `http://purl.obolibrary.org/obo/RXNO_0000524`
- Castro-Stephens coupling `http://purl.obolibrary.org/obo/RXNO_0000525`
- Chichibabin pyridine synthesis `http://purl.obolibrary.org/obo/RXNO_0000526`
- Clauson-Kaas reaction `http://purl.obolibrary.org/obo/RXNO_0000312`
- Doebner reaction `http://purl.obolibrary.org/obo/RXNO_0000126`
- Edman degradation `http://purl.obolibrary.org/obo/RXNO_0000071`
- Fmoc protection `http://purl.obolibrary.org/obo/RXNO_0000160`
- Fukuyama coupling `http://purl.obolibrary.org/obo/RXNO_0000605`
- Horner reaction `http://purl.obolibrary.org/obo/RXNO_0000057`
- Horner-Wadsworth-Emmons reaction `http://purl.obolibrary.org/obo/RXNO_0000056`
- Julia olefination `http://purl.obolibrary.org/obo/RXNO_0000117`
- Julia-Kocienski olefination `http://purl.obolibrary.org/obo/RXNO_0000304`
- Kröhnke pyridine synthesis `http://purl.obolibrary.org/obo/RXNO_0000420`
- Leimgruber-Batcho indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000672`
- Madelung indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000511`
- Miyaura borylation `http://purl.obolibrary.org/obo/RXNO_0000659`
- Mori-Ban indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000307`
- Paal-Knorr pyrrole synthesis `http://purl.obolibrary.org/obo/RXNO_0000164`
- Peterson olefination `http://purl.obolibrary.org/obo/RXNO_0000080`
- Polonovski-Potier reaction `http://purl.obolibrary.org/obo/RXNO_0000222`
- Sakurai reaction, aldehyde or ketone `http://purl.obolibrary.org/obo/RXNO_0000212`
- Shi epoxidation `http://purl.obolibrary.org/obo/RXNO_0000687`
- Skraup reaction `http://purl.obolibrary.org/obo/RXNO_0000062`
- Smith indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000512`
- Sonogashira coupling `http://purl.obolibrary.org/obo/RXNO_0000137`
- Stork-Wittig olefination `http://purl.obolibrary.org/obo/RXNO_0000251`
- Tamao oxidation `http://purl.obolibrary.org/obo/RXNO_0000211`
- Wittig reaction `http://purl.obolibrary.org/obo/RXNO_0000015`
- acetoacetic ester synthesis `http://purl.obolibrary.org/obo/RXNO_0000459`
- amide reduction to amine `http://purl.obolibrary.org/obo/RXNO_0000338`
- benzyl ether protection `http://purl.obolibrary.org/obo/RXNO_0000324`
- benzylamine deprotection `http://purl.obolibrary.org/obo/RXNO_0000327`
- deprotection reaction `http://purl.obolibrary.org/obo/RXNO_0000203`
- ethyl ester deprotection `http://purl.obolibrary.org/obo/RXNO_0000436`
- intermolecular acyloin condensation `http://purl.obolibrary.org/obo/RXNO_0000461`
- intramolecular acyloin condensation `http://purl.obolibrary.org/obo/RXNO_0000460`
- malonic ester synthesis `http://purl.obolibrary.org/obo/RXNO_0000107`
- methyl ester deprotection `http://purl.obolibrary.org/obo/RXNO_0000435`
- nitro reduction to amine `http://purl.obolibrary.org/obo/RXNO_0000337`
- palladium-catalysed Kumada coupling `http://purl.obolibrary.org/obo/RXNO_0000541`
- phthalimide deprotection `http://purl.obolibrary.org/obo/RXNO_0000419`
- phthalimide protection `http://purl.obolibrary.org/obo/RXNO_0000418`
- pivaloyl deprotection `http://purl.obolibrary.org/obo/RXNO_0000429`
- protection reaction `http://purl.obolibrary.org/obo/RXNO_0000078`
- silyl deprotection `http://purl.obolibrary.org/obo/RXNO_0000692`
- tert-butyl ester deprotection `http://purl.obolibrary.org/obo/RXNO_0000434`
- tert-butyl protection `http://purl.obolibrary.org/obo/RXNO_0000432`

#### Materialization of Inferred Parents
**Cause:**
Within the reasoning step that is done automatically by ODK when producing the RXNO release artifact from the editor file, an additional inferred parent will be materialized on some classes. 

**Action:**
TODO: Whether this axiomatisation is intended will be checked in a later stage, see also [issue #76](https://github.com/rsc-ontology/rxno/issues/76) and [issue #77](https://github.com/rsc-ontology/rxno/issues/77). Here is the list of terms and IRIs were this change took place:

**Affected terms (34):**

- Asinger reaction `http://purl.obolibrary.org/obo/RXNO_0000688`
- Baeyer oxindole synthesis `http://purl.obolibrary.org/obo/RXNO_0000671`
- Fenton 1,2-glycol oxidation `http://purl.obolibrary.org/obo/RXNO_0000651`
- Fenton alpha-hydroxy carboxylic acid oxidation `http://purl.obolibrary.org/obo/RXNO_0000652`
- Fenton hydrogen peroxide reduction `http://purl.obolibrary.org/obo/RXNO_0000653`
- Jacobsen epoxidation `http://purl.obolibrary.org/obo/RXNO_0000686`
- Meerwein-Ponndorf-Verley reduction of a ketone `http://purl.obolibrary.org/obo/RXNO_0000623`
- Meerwein-Ponndorf-Verley reduction of an aldehyde `http://purl.obolibrary.org/obo/RXNO_0000622`
- Baeyer diarylmethane synthesis `http://purl.obolibrary.org/obo/RXNO_0000691`
- Balsohn alkylation `http://purl.obolibrary.org/obo/RXNO_0000675`
- Diimide reduction `http://purl.obolibrary.org/obo/RXNO_0000656`
- Duff reaction `http://purl.obolibrary.org/obo/RXNO_0000447`
- Elbs persulfate oxidation, tolyl variant `http://purl.obolibrary.org/obo/RXNO_0000180`
- Favorskii reaction `http://purl.obolibrary.org/obo/RXNO_0000655`
- Friedel-Crafts reaction `http://purl.obolibrary.org/obo/RXNO_0000369`
- Fukuyama coupling `http://purl.obolibrary.org/obo/RXNO_0000605`
- Gattermann reaction `http://purl.obolibrary.org/obo/RXNO_0000139`
- Groebke-Blackburn-Bienaymé reaction `http://purl.obolibrary.org/obo/RXNO_0000670`
- Heck reaction `http://purl.obolibrary.org/obo/RXNO_0000024`
- Hell-Volhard-Zelinsky reaction `http://purl.obolibrary.org/obo/RXNO_0000621`
- Hofmann-Löffler-Freytag piperidine synthesis `http://purl.obolibrary.org/obo/RXNO_0000619`
- Hofmann-Löffler-Freytag pyrrolidine synthesis `http://purl.obolibrary.org/obo/RXNO_0000620`
- Johnson-Corey-Chaykovsky aziridine synthesis `http://purl.obolibrary.org/obo/RXNO_0000601`
- Johnson-Corey-Chaykovsky epoxide synthesis `http://purl.obolibrary.org/obo/RXNO_0000599`
- Johnson-Corey-Chaykovsky thiirane synthesis `http://purl.obolibrary.org/obo/RXNO_0000602`
- Kolbe electrolysis `http://purl.obolibrary.org/obo/RXNO_0000128`
- Miyaura borylation `http://purl.obolibrary.org/obo/RXNO_0000659`
- Mukaiyama hydration `http://purl.obolibrary.org/obo/RXNO_0000654`
- Reimer-Tiemann reaction `http://purl.obolibrary.org/obo/RXNO_0000072`
- Vilsmeier-Haack reaction `http://purl.obolibrary.org/obo/RXNO_0000055`
- alkyne-azide click reaction `http://purl.obolibrary.org/obo/RXNO_0000269`
- benzimidazole synthesis `http://purl.obolibrary.org/obo/RXNO_0000398`
- oxa-Pictet-Spengler reaction `http://purl.obolibrary.org/obo/RXNO_0000404`
- polymerisation reaction `http://purl.obolibrary.org/obo/RXNO_0000246`


### Semantic Changes
#### Replacement of BFO with RO Relations
**Cause:**
In the axiomatization of RXNO terms, BFO relations, such as `BFO_0000057 # has_participant`, were used that are not supported by the BFO classes only version used in the OBO Foundry. According to the [OBO Foundry principle 7](https://obofoundry.org/principles/fp-007-relations.html) relations defined in the Relations Ontology (RO) should be used whenever possible, which is the case for such high level BFO relations.

**Action:**
In the ODK migration these BFO relations were replaced with suitable RO equivalents in [PR#68](https://github.com/rsc-ontology/rxno/pull/68). Here is the list of terms and IRIs were this change took place, along with the affected classes:

**Affected terms (14):**

- [BFO_0000057](http://purl.obolibrary.org/obo/BFO_0000057) `has participant` → [RO_0000057](http://purl.obolibrary.org/obo/RO_0000057) `has participant`
  - Crabbé homologation `http://purl.obolibrary.org/obo/RXNO_0000368`
  - Feist-Bénary synthesis `http://purl.obolibrary.org/obo/RXNO_0000501`
  - has_catalyst `http://purl.obolibrary.org/obo/RXNO_0000425`
  - has_intermediate `http://purl.obolibrary.org/obo/RXNO_0000469`
- [BFO_0000077](http://purl.obolibrary.org/obo/BFO_0000077) `has participant beginning to exist` → [RO_0004008](http://purl.obolibrary.org/obo/RO_0004008) `has primary output`
  - carboxylic acid to primary alcohol reduction `http://purl.obolibrary.org/obo/RXNO_0000431`
  - deprotects `http://purl.obolibrary.org/obo/RXNO_0000417`
  - ester condensation reaction `http://purl.obolibrary.org/obo/RXNO_0000317`
  - has specified product `http://purl.obolibrary.org/obo/RXNO_0000423`
- [BFO_0000078](http://purl.obolibrary.org/obo/BFO_0000078) `has participant ceasing to exist` → [RO_0004009](http://purl.obolibrary.org/obo/RO_0004009) `has primary input`
  - Kolbe-Schmitt reaction `http://purl.obolibrary.org/obo/RXNO_0000182`
  - Leuckart aldehyde reaction `http://purl.obolibrary.org/obo/RXNO_0000552`
  - Leuckart ketone reaction `http://purl.obolibrary.org/obo/RXNO_0000553`
  - carboxylic acid to primary alcohol reduction `http://purl.obolibrary.org/obo/RXNO_0000431`
  - has specified reactant `http://purl.obolibrary.org/obo/RXNO_0000424`
  - protects `http://purl.obolibrary.org/obo/RXNO_0000416`

#### Resynchronization After MOP Disentanglement  
**Cause:**
Before the ODK migration, RXNO used wrong IDs for some MOP classes that were used as parents for RXNO classes, e.g. `MOP_0000713` was used for `carboxylation`, whereas `MOP_0000591` is the correct ID in MOP. For more details, check MOP ODM migration docs: [Critical Severity: IRI clashes - One IRI, two different reactions](https://rsc-ontology.github.io/mop/odk-diff/#critical-severity-iri-clashes-one-iri-two-different-reactions).

**Action:**
Those RXNO classes got their subClassOf axioms updated. 

**Affected terms (7):**
- Kolbe-Schmitt reaction `http://purl.obolibrary.org/obo/RXNO_0000182`
- Lemieux-Johnson oxidation `http://purl.obolibrary.org/obo/RXNO_0000649`
- Criegee oxidation `http://purl.obolibrary.org/obo/RXNO_0000257`
- Malaprade reaction `http://purl.obolibrary.org/obo/RXNO_0000650`
- alkyne-azide click reaction `http://purl.obolibrary.org/obo/RXNO_0000269`
- copper(I)-catalyzed azide-alkyne cycloaddition `http://purl.obolibrary.org/obo/RXNO_0000270`
- Seyferth-Gilbert homologation `http://purl.obolibrary.org/obo/RXNO_0000387`

#### COB Dependency Adoption
**Cause:**
With the [2025-12-18 Release](https://github.com/obi-ontology/obi/releases#release-v2025-12-18), the Ontology for Biomedical Investigations (OBI) started using the BFO-aligned Core Ontology for Biology and Biomedicine (COB) as their top-level ontology. This change included the deprecation of some of their terms in favor of COB terms. Since RXNO reused the now deprecated `planned process` [OBI_0000011](http://purl.obolibrary.org/obo/OBI_0000011), all relevant axioms had to be updated to point to its COB replacement: `completely executed planned process` [COB_0000035](http://purl.obolibrary.org/obo/COB_0000035). 

**Affected terms: (2)**

- planned reaction step `http://purl.obolibrary.org/obo/RXNO_0000001`
- planned synthesis `http://purl.obolibrary.org/obo/RXNO_0000329`

### Metadata Changes

#### Ontology Annotation Changes

The ontology annotations of RXNO were updated in the course of the ODK migration. This included switching from using DC Elements predicates to DC Terms ones for `title` and `description` (see https://github.com/rsc-ontology/rxno/pull/74), adding Colin Batchelor and the NFDI4Chem team as contributors and using the `owl:versionInfo` autogenerated by ODK. The fact that we are also comparing base releases (versions that only declare external terms but not further define them), explains also the additional DC Elements `type` annotation. It is added automatically by ODK for any base release, whereas it was not added for the pre-ODK RXNO version, because we manually created this base release with ROBOT.

### Classes Annotations Changes
The two annotations properties [dc11:creator](http://purl.org/dc/elements/1.1/creator) and [dc11:date](http://purl.org/dc/elements/1.1/date) were removed and instead, the annotations properties [dcterms:creator](http://purl.org/dc/terms/creator) and [dcterms:date](http://purl.org/dc/terms/date) were added respectively. 
This was done in the [PR: Update from using the deprecated DC Elements to using the recommended DC Terms - #74](https://github.com/rsc-ontology/rxno/pull/74)

**Affected terms: (38)**

- Albright-Goldman oxidation `http://purl.obolibrary.org/obo/RXNO_0000668`
- Asinger reaction `http://purl.obolibrary.org/obo/RXNO_0000688`
- Aston-Greenburg rearrangement `http://purl.obolibrary.org/obo/RXNO_0000678`
- Atherton-Todd reaction `http://purl.obolibrary.org/obo/RXNO_0000690`
- Baddeley isomerization `http://purl.obolibrary.org/obo/RXNO_0000679`
- Baekeland-Manasse-Lederer reaction `http://purl.obolibrary.org/obo/RXNO_0000677`
- Baeyer diarylmethane synthesis `http://purl.obolibrary.org/obo/RXNO_0000691`
- Baeyer oxindole synthesis `http://purl.obolibrary.org/obo/RXNO_0000671`
- Baeyer pyridine synthesis `http://purl.obolibrary.org/obo/RXNO_0000664`
- Balsohn alkylation `http://purl.obolibrary.org/obo/RXNO_0000675`
- Corey-Kim oxidation `http://purl.obolibrary.org/obo/RXNO_0000665`
- Corey-Schmidt oxidation `http://purl.obolibrary.org/obo/RXNO_0000667`
- Corey-Seebach reaction `http://purl.obolibrary.org/obo/RXNO_0000662`
- Corey-Suggs oxidation `http://purl.obolibrary.org/obo/RXNO_0000666`
- Corey-Winter elimination `http://purl.obolibrary.org/obo/RXNO_0000660`
- Diimide reduction `http://purl.obolibrary.org/obo/RXNO_0000656`
- Dötz reaction `http://purl.obolibrary.org/obo/RXNO_0000681`
- Fukuyama reduction `http://purl.obolibrary.org/obo/RXNO_0000680`
- Groebke-Blackburn-Bienaymé reaction `http://purl.obolibrary.org/obo/RXNO_0000670`
- IBX oxidation `http://purl.obolibrary.org/obo/RXNO_0000673`
- Jacobsen epoxidation `http://purl.obolibrary.org/obo/RXNO_0000686`
- Kabachnik-Fields reaction `http://purl.obolibrary.org/obo/RXNO_0000676`
- Kulinkovich reaction `http://purl.obolibrary.org/obo/RXNO_0000682`
- Kulinkovich-Szymoniak reaction `http://purl.obolibrary.org/obo/RXNO_0000684`
- Kulinkovich-de Meijere reaction `http://purl.obolibrary.org/obo/RXNO_0000683`
- Leimgruber-Batcho indole synthesis `http://purl.obolibrary.org/obo/RXNO_0000672`
- Miyaura borylation `http://purl.obolibrary.org/obo/RXNO_0000659`
- Mukaiyama hydration `http://purl.obolibrary.org/obo/RXNO_0000654`
- Rubottom oxidation `http://purl.obolibrary.org/obo/RXNO_0000669`
- Shi epoxidation `http://purl.obolibrary.org/obo/RXNO_0000687`
- Tsuji-Wilkinson decarbonylation `http://purl.obolibrary.org/obo/RXNO_0000661`
- acetal protection `http://purl.obolibrary.org/obo/RXNO_0000658`
- carbonyl group protection `http://purl.obolibrary.org/obo/RXNO_0000657`
- decarboxylative cross-coupling `http://purl.obolibrary.org/obo/RXNO_0000674`
- haloform reaction `http://purl.obolibrary.org/obo/RXNO_0000689`
- nitroxide exchange reaction `http://purl.obolibrary.org/obo/RXNO_0000663`
- silyl deprotection `http://purl.obolibrary.org/obo/RXNO_0000692`
- thiol-yne reaction `http://purl.obolibrary.org/obo/RXNO_0000383`