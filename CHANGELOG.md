# Changelog

## [0.1.0] - 2019-07-04

### Added

- Package ONIX 2.0 and 2.1 DTD files
- Package `catalog.xml` referencing these files
- Add `Cacofonix::DTDs.xml_catalog_path` to point to `catalog.xml` file location
- Add `Cacofonix::DTDs.apply_libxml_env!` to set XML_CATALOG_FILES ENV and ensure the catalog file is picked up when using a libxml-based XML library like Nokogiri
