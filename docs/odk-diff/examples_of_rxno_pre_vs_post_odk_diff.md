After generating the diff files rxno_pre_vs_post_odk_diff.html and rxno_pre_vs_post_odk_diff.md as depicted in the README, here we provide a simplified view of the diffs with examples and the corresponding IRIs.

# Ontology comparison

## Left
- Ontology IRI: `http://purl.obolibrary.org/obo/rxno.owl`
- Version IRI: `http://purl.obolibrary.org/obo/rxno/releases/2021-12-16/rxno.owl`
- Loaded from: `./rxno_base_pre_odk.owl`

## Right
- Ontology IRI: `http://purl.obolibrary.org/obo/rxno.owl`
- Version IRI: `http://purl.obolibrary.org/obo/rxno/releases/2026-10-07/rxno.owl`
- Loaded from: `./rxno_base_post_odk.owl`

### Ontology annotations 
The two ontology annotations [dc11:description](http://purl.org/dc/elements/1.1/description) and [dc11:title](http://purl.org/dc/elements/1.1/title) were removed and replaced by [dc:description](http://purl.org/dc/terms/description) and [dc:title](http://purl.org/dc/terms/title) respectively. 
[dc:versionInfo](http://purl.org/dc/terms/versionInfo) was added.
This was done in the [PR: Update from using the deprecated DC Elements to using the recommended DC Terms - #74](https://github.com/rsc-ontology/rxno/pull/74)

### Classes annotations 
The two annotations properties [dc11:creator](http://purl.org/dc/elements/1.1/creator) and [dc11:date](http://purl.org/dc/elements/1.1/date) were removed and replaced by [dc:creator](http://purl.org/dc/terms/creator) and [dc:date](http://purl.org/dc/terms/date) respectively. 
This was done in the [PR: Update from using the deprecated DC Elements to using the recommended DC Terms - #74](https://github.com/rsc-ontology/rxno/pull/74)

Here is the list of terms and IRIs were this change took place:
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


### Classes axiomatization
#### Classes with more specific parent
Some classes were inferred to be under a class that is already under their original parent, so they were moved accordingly, turning their original parent into a grand parent. Those classes will be asserted later under their new parents according to [issue #76](https://github.com/rsc-ontology/rxno/issues/76). Here is the list of terms and IRIs were this change took place:

- Asinger reaction `http://purl.obolibrary.org/obo/RXNO_0000688`
- Baeyer oxindole synthesis `http://purl.obolibrary.org/obo/RXNO_0000671`
- Fenton 1,2-glycol oxidation `http://purl.obolibrary.org/obo/RXNO_0000651`
- Fenton alpha-hydroxy carboxylic acid oxidation `http://purl.obolibrary.org/obo/RXNO_0000652`
- Fenton hydrogen peroxide reduction `http://purl.obolibrary.org/obo/RXNO_0000653`
- Horner reaction `http://purl.obolibrary.org/obo/RXNO_0000057`
- Jacobsen epoxidation `http://purl.obolibrary.org/obo/RXNO_0000686`
- Meerwein-Ponndorf-Verley reduction of a ketone `http://purl.obolibrary.org/obo/RXNO_0000623`
- Meerwein-Ponndorf-Verley reduction of an aldehyde `http://purl.obolibrary.org/obo/RXNO_0000622`

#### Classes with duplicated axioms
In these cases, the same axiom appears under both the class and one of its ancestors, in Protege, this would be under "SubClass of" and "SubClass of anonymous ancestor". In these cases, we should delete the axiom under SubClass of [issue #76](https://github.com/rsc-ontology/rxno/issues/76). Here is a full list:
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

#### Classes with a new parent
Some classes just got a new axiom subsuming them under an additional parent. They will be reconsidered in the [issue #77](https://github.com/rsc-ontology/rxno/issues/77) to evaluate what to be asserted and what to be inferred. Here is the list of terms and IRIs were this change took place:

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


### Imported classes
#### BFO to RO
Many BFO object properties were replaced by RO counterparts. This was done in the PR: [Import ontology modules
#68](https://github.com/rsc-ontology/rxno/pull/68). Here is the list of terms and IRIs were this change took place, along with the affected classes:
- has participant: BFO_0000057 `http://purl.obolibrary.org/obo/BFO_0000057` to has primary output: RO_0000057 `http://purl.obolibrary.org/obo/RO_0000057`
  - Crabbé homologation `http://purl.obolibrary.org/obo/RXNO_0000368`
  - Feist-Bénary synthesis `http://purl.obolibrary.org/obo/RXNO_0000501`
  -  has_catalyst `http://purl.obolibrary.org/obo/RXNO_0000425`
  - has_intermediate `http://purl.obolibrary.org/obo/RXNO_0000469`
- has participant beginning to exist: BFO_0000077 `http://purl.obolibrary.org/obo/BFO_0000077` to has primary output: RO_0004008 `http://purl.obolibrary.org/obo/RO_0004008`
  - carboxylic acid to primary alcohol reduction `http://purl.obolibrary.org/obo/RXNO_0000431`
  - deprotects `http://purl.obolibrary.org/obo/RXNO_0000417`
  - ester condensation reaction `http://purl.obolibrary.org/obo/RXNO_0000317`
  - has specified product `http://purl.obolibrary.org/obo/RXNO_0000423`
- has participant ceasing to exist: BFO_0000078 `http://purl.obolibrary.org/obo/BFO_0000078` to has primary input: RO_0004009 `http://purl.obolibrary.org/obo/RO_0004009`
  - Kolbe-Schmitt reaction `http://purl.obolibrary.org/obo/RXNO_0000182`
  - Leuckart aldehyde reaction `http://purl.obolibrary.org/obo/RXNO_0000552`
  - Leuckart ketone reaction `http://purl.obolibrary.org/obo/RXNO_0000553`
  - carboxylic acid to primary alcohol reduction `http://purl.obolibrary.org/obo/RXNO_0000431`
  - has specified reactant `http://purl.obolibrary.org/obo/RXNO_0000424`
  - protects `http://purl.obolibrary.org/obo/RXNO_0000416`

#### Imported MOP classes 
- Newly imported MOP classes: The direct import of MOP into RXNO with `owl:import` resulted in the addition of new MOP classes:
  - polymerisation: MOP_0000629 `http://purl.obolibrary.org/obo/MOP_0000629`
- Imported MOP classes as a replacement to other MOP classes defined in RXNO with same label and different MOP ID:

  Same classes were defined in both RXNO and MOP using the same labels but different MOP IDs. Those cases were described in the issue [Disentangle MOP and RXNO - #63](https://github.com/rsc-ontology/rxno/pull/63)
    - carboxylation: MOP_0000591 `http://purl.obolibrary.org/obo/MOP_0000591` as a replacement to carboxylation: MOP_0000713 `http://purl.obolibrary.org/obo/MOP_0000713`

- Some other classes were defined in both RXNO and MOP using the same labels but different RXNO and MOP IDs. RXNO classes were deprecated in favor of the imported MOP classes and their children got their axioms updated accordingly:
  - alkene oxidative cleavage: MOP_0000708 `http://purl.obolibrary.org/obo/MOP_0000708` to replace alkene oxidative cleavage: RXNO_0000344 `http://purl.obolibrary.org/obo/RXNO_0000344`
  - trimerization: MOP_0006371 `http://purl.obolibrary.org/obo/MOP_0006371` to replace trimerization: MOP_0000715 `http://purl.obolibrary.org/obo/MOP_0000715`
    - alkyne-azide click reaction `http://purl.obolibrary.org/obo/RXNO_0000269`
    - copper(I)-catalyzed azide-alkyne cycloaddition `http://purl.obolibrary.org/obo/RXNO_0000270`

- Some IDs were used in both  RXNO and MOP to reflect different classes: 
  - http://purl.obolibrary.org/obo/MOP_0000714 was used for `carbonyl oxidation to alkyne` in RXNO but for `ligand exchange reaction` in MOP. `carbonyl oxidation to alkyne` received a new ID in MOP `http://purl.obolibrary.org/obo/MOP_0006370` and the axcioms of its child Seyferth-Gilbert homologation `http://purl.obolibrary.org/obo/RXNO_0000387` were updated accordingly.

### Adopting COB
Several COB classes were added either as new classes or as a replacement to the deprecated OBI ones. Here is a list of these COB classes and the affected children:
- completely executed planned process: COB_0000035 `http://purl.obolibrary.org/obo/COB_0000035`
- planned process: COB_0000082 `http://purl.obolibrary.org/obo/COB_0000082` as a replacement to planned process: OBI_0000011 `http://purl.obolibrary.org/obo/OBI_0000011` 
  - planned reaction step `http://purl.obolibrary.org/obo/RXNO_0000001`
  - planned synthesis `http://purl.obolibrary.org/obo/RXNO_0000329`
### Deprecate RXNO classes in favor of MOP counterparts and update the subsuming of children classes accordingly  
- Deprecate alkene oxidative cleavage `http://purl.obolibrary.org/obo/RXNO_0000344` in favor of alkene oxidative cleavage `http://purl.obolibrary.org/obo/MOP_0000708`. Update the subsuming of children classes
  - Criegee oxidation `http://purl.obolibrary.org/obo/RXNO_0000257`
  - Malaprade reaction `http://purl.obolibrary.org/obo/RXNO_0000650`


### Single class changes
Here we list the changes that were applied uniquely to single classes.:

#### Cativa process `http://purl.obolibrary.org/obo/RXNO_0000133` 
Done in [PR:Fix cativa process definition - #48](https://github.com/rsc-ontology/rxno/pull/48)

Removed:
- [Cativa process](http://purl.obolibrary.org/obo/RXNO_0000133) [IAO_0000115](http://purl.obolibrary.org/obo/IAO_0000115) "The reaction of carbon monoxide with methanol to form acetic acid, catalysed by an iridium complex." 

- [Cativa process](http://purl.obolibrary.org/obo/RXNO_0000133) SubClassOf [has specified reactant](http://purl.obolibrary.org/obo/RXNO_0000424) some [CHEBI_17245](http://purl.obolibrary.org/obo/CHEBI_17245) 

Added:
- [Cativa process](http://purl.obolibrary.org/obo/RXNO_0000133) [IAO_0000115](http://purl.obolibrary.org/obo/IAO_0000115) "The reaction of formaldehyde with methanol to form acetic acid, catalysed by an iridium complex." 

- [Cativa process](http://purl.obolibrary.org/obo/RXNO_0000133) SubClassOf [has specified reactant](http://purl.obolibrary.org/obo/RXNO_0000424) some [CHEBI_16842](http://purl.obolibrary.org/obo/CHEBI_16842) 

#### Kolbe-Schmitt reaction `http://purl.obolibrary.org/obo/RXNO_0000182`
Done in [PR:Disentangle MOP and RXNO - #63](https://github.com/rsc-ontology/rxno/pull/63)

Removed:
- [Kolbe-Schmitt reaction](http://purl.obolibrary.org/obo/RXNO_0000182) SubClassOf [MOP_0000713](http://purl.obolibrary.org/obo/MOP_0000713) 

Added:
- [Kolbe-Schmitt reaction](http://purl.obolibrary.org/obo/RXNO_0000182) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "Prior to the resolving of https://github.com/rsc-ontology/rxno/issues/27 the parent of this class was wrongly also defined in RXNO under the ID MOP:0000713 ('acetylene reduction'). 
Thus the &quot;has_participant some 'carboxy group'&quot; axiom, which was not yet present on 'carboxylation' (MOP:0000591) in MOP was copied from this wrongly defined  'carboxylation' in RXNO to the proper one in MOP.

The only RXNO subclass 'Kolbe-Schmitt reaction' (RXNO:0000182) of 'carboxylation' was also moved to be correctly subsumed in RXNO." 
  - [created_by](http://www.geneontology.org/formats/oboInOwl#created_by) [0000-0002-1595-3213](https://orcid.org/0000-0002-1595-3213) 

- [Kolbe-Schmitt reaction](http://purl.obolibrary.org/obo/RXNO_0000182) SubClassOf [MOP_0000591](http://purl.obolibrary.org/obo/MOP_0000591) 

- [Kolbe-Schmitt reaction](http://purl.obolibrary.org/obo/RXNO_0000182) SubClassOf [RO_0004009](http://purl.obolibrary.org/obo/RO_0004009) some [CHEBI_16526](http://purl.obolibrary.org/obo/CHEBI_16526) 


#### Lemieux-Johnson oxidation `http://purl.obolibrary.org/obo/RXNO_0000649`
Done in [PR:Disentangle MOP and RXNO - #63](https://github.com/rsc-ontology/rxno/pull/63)

Removed: 
- [Lemieux-Johnson oxidation](http://purl.obolibrary.org/obo/RXNO_0000649) SubClassOf [alkene oxidative cleavage](http://purl.obolibrary.org/obo/RXNO_0000344) 

Added:
- [Lemieux-Johnson oxidation](http://purl.obolibrary.org/obo/RXNO_0000649) SubClassOf [MOP_0000708](http://purl.obolibrary.org/obo/MOP_0000708) 


#### Monsanto process `http://purl.obolibrary.org/obo/RXNO_0000132`
Done in [PR:Disentangle MOP and RXNO - #63](https://github.com/rsc-ontology/rxno/pull/63)

Removed: 
- [Monsanto process](http://purl.obolibrary.org/obo/RXNO_0000132) [IAO_0000115](http://purl.obolibrary.org/obo/IAO_0000115) "The reaction of carbon monoxide with methanol to form acetic acid, catalysed by a rhodium complex." 

- [Monsanto process](http://purl.obolibrary.org/obo/RXNO_0000132) SubClassOf [has specified reactant](http://purl.obolibrary.org/obo/RXNO_0000424) some [CHEBI_17245](http://purl.obolibrary.org/obo/CHEBI_17245) 

Added:
- [Monsanto process](http://purl.obolibrary.org/obo/RXNO_0000132) [IAO_0000115](http://purl.obolibrary.org/obo/IAO_0000115) "The reaction of formaldehyde with methanol to form acetic acid, catalysed by a rhodium complex." 

- [Monsanto process](http://purl.obolibrary.org/obo/RXNO_0000132) SubClassOf [has specified reactant](http://purl.obolibrary.org/obo/RXNO_0000424) some [CHEBI_16842](http://purl.obolibrary.org/obo/CHEBI_16842) 

 








