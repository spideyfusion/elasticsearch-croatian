# Elasticsearch compatible Hunspell dictionary for Croatian

[![Build Status](https://travis-ci.org/spideyfusion/elasticsearch-croatian.svg?branch=master)](https://travis-ci.org/spideyfusion/elasticsearch-croatian)

This dictionary is meant to be used in combination with Elasticsearch's [Hunspell Stemmer](https://www.elastic.co/guide/en/elasticsearch/guide/current/hunspell.html) in order to provide support for searching of Croatian words inside documents. It's based on the [hr-hunspell](https://github.com/krunose/hr-hunspell) project.

## Differences

### Removed diacritics

All diacritic letters (č, ć, đ, š, ž) have been substituted with their ASCII equivalents since native Croatian speakers don't tend to use them at search time.

### Removed comments

All comments have been omitted from the affix file in order to preserve compatibility with Apache Lucene's dictionary parser.

## Building

Building is currently only supported on Linux platforms. You'll need the following tools: `awk`, `bash`, `cut`, `grep`, `sed`, `wc`, `zip`

* From the root of the repository run `script/build.sh`.
* Grab the `release.zip` archive from the `.build` directory and follow the installation [instructions](#installation).

## Installation

* Extract the [downloaded](https://github.com/spideyfusion/elasticsearch-croatian/releases/latest) or [built](#building) ZIP archive contents to `./hunspell/hr_HR/` (relative to Elasticsearch's configuration directory, usually `/etc/elasticsearch/`).
* If Elasticsearch is already running, restart it.

## Testing

To run tests you'll need to have [Docker](https://www.docker.com/) (**17.09+**), [Python](https://www.python.org/) (**3.0+**) and the following tools: `bash`, `cat`, `cut`, `curl`, `head`, `tail`

* [Build](#building) the dictionary.
* Navigate to the root of the repository.
* Build the Docker image with `docker build --build-arg ES_VERSION=latest -t spideyfusion/elasticsearch-croatian .`.
* Start the Docker container with `docker run --rm -p 9200:9200 spideyfusion/elasticsearch-croatian`.
* Run the tests by executing `script/test.sh`.

> **NOTE:** You can specify which version of Elasticsearch you want to build using the `ES_VERSION` build argument (e.g. **5.6.4**).

## Credits

* Thanks to [Kruno](https://github.com/krunose) for maintaining the original dictionary.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT). The unmodified dictionary license can be found in the [README_hr_HR](README_hr_HR.txt) text file.
