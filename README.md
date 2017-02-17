# Elasticsearch compatible Hunspell dictionary for Croatian

This dictionary is meant to be used in combination with Elasticsearch's [Hunspell Stemmer](https://www.elastic.co/guide/en/elasticsearch/guide/current/hunspell.html) in order to provide support for searching of Croatian words inside documents. It's based on LibreOffice's [dictionary](https://github.com/LibreOffice/dictionaries/tree/master/hr_HR).

## Differences

### Removed diacritics

All diacritic letters (č, ć, đ, š, ž) have been substituted with their ASCII equivalents since native Croatian speakers don't tend to use them at search time.

### Removed comments

All comments have been omitted from the affix file in order to preserve compatibility with Apache Lucene's dictionary parser.

## Installation

* Place all the files from the root of this repository to `./hunspell/hr_HR/` (relative to Elasticsearch's configuration directory, usually `/etc/elasticsearch/`).
* If Elasticsearch is already running, restart it.

## Credits

* Thanks to [Kruno](mailto:kruno.se@gmx.com) for maintaining LibreOffice's dictionary.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT). The unmodified dictionary license can be found in the [README_hr_HR](README_hr_HR.txt) text file.
