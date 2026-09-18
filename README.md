[![License: CC-BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-green.svg)](https://creativecommons.org/licenses/by/4.0/) 
[![CI](https://github.com/rsc-ontology/RXNO/actions/workflows/qc.yml/badge.svg)](https://github.com/rsc-ontology/RXNO/actions/workflows/qc.yml)

# Name Reaction Ontology (RXNO) 
RXNO, the name reaction ontology, contains more than 500 classes representing organic name reactions such as the Diels-Alder cyclization and the Cannizzaro reaction, It connects them to their roles in an organic synthesis and to processes in [MOP](https://github.com/rsc-ontology/MOP).


## Versions
The OWL & OBO files in the release assets of this repository are the official release artifacts of the ontology. To find out more about the standardization approach behind these (e.g. why they are so many), see [this section](https://oboacademy.github.io/obook/reference/release-artefacts/) in the OBOOK (also a great place to learn more about OBO based ontology development and curation).

### Stable release versions

The latest version of the ontology can always be found at the top of:

https://github.com/rsc-ontology/RXNO/releases

### Editors' version

Editors of this ontology should use the edit version, [src/ontology/rxno-edit.owl](src/ontology/rxno-edit.owl)

## Contributing

Please use this GitHub repository's [Issue tracker](https://github.com/rsc-ontology/RXNO/issues) to request new terms/classes or report errors or specific concerns related to the ontology. For a more elaborated _how-to_, please go [here](https://github.com/rsc-ontology/RXNO/blob/main/CONTRIBUTING.md).


To add new reactions to RXNO follow the instructions below using the flowcharts provided in the [documentation folder](/docs): 
1. Determine the "skeleton" using the [skeleton flowchart](/docs/flowchart_skeleton.md).
2. Go through the [reaction flowchart](/docs/flowchart.md) to find the correct parent class for the new reaction that you would like to add.


## Acknowledgements

This ontology repository was created using the [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit).


More information can be found at http://obofoundry.org/ontology/rxno