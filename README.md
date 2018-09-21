# metadata-census-rdc
This repository contains raw metadata, as well as marked up metadata, for a variety of data in the Census Bureau's RDC

## metadata-raw
The 'raw' metadata was collected by requesting 'zero-obs' datasets from Census Bureau data staff. Such requests were passed through the Census Bureau's Disclosure Review Board to ensure that no confidential data was released in this fashion. The datasets were used to populate the *[Simulated Census RDC](https://www2.vrdc.cornell.edu/news/simulated-census-rdc-2/)* at Cornell University. Interested researchers could experience a Linux desktop environment emulating the confidential computing environment, and could create programs that used these (empty) test files. 

This 'raw' metadata contains the variable names and labels of the confidential data, and their collection in the form of datasets.

## metadata-ddi
The 'zero-obs' datasets were converted to DDI using a very simple scripted pipeline ([CESJobstream](https://github.com/ncrncornell/svn-CESJobstream)), in combination with a custom extract of dataset abstracts from the internal Census Bureau database (all information was reviewed so it did not contain confidential information).
