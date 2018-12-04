# Changelog

## Release v2.3.0

* Updated the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell/blob/master/izmjene-u-rje%C4%8Dniku.md) dictionary to version 2.1.1 (2018-12-03).
* Simplified the Travis CI configuration and added more Elasticsearch testing targets.
* Migrated the entire build process to be inside the Docker image.
* Updated the test script to ensure compatibility with Elasticsearch 7.x and later.

## Release v2.2.0

* Added support for Elasticsearch 6.x versions. Any version older than 5.6 is no longer being tested against.
* Updated the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell/blob/master/izmjene-u-rje%C4%8Dniku.md) dictionary to version 2.1.1 (2017-11-17).
* Simplified the Docker installation steps inside Travis CI.
* Improved test script compatibility with Bash 4.x versions.

## Release v2.1.2

* Updated the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell/blob/master/izmjene-u-rje%C4%8Dniku.md) dictionary to version 2.1.1 (2017-10-11).
* Removed support for adding dictionary specific patches.

## Release v2.1.1

* Updated the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell/blob/master/izmjene-u-rje%C4%8Dniku.md) dictionary to version 2.1.1 (2017-08-16).

## Release v2.1.0

* Added support for applying word-specific patches to the dictionary during the update process.
* Improved build script compatibility with Bash 4.x versions.
* Travis CI now targets Elasticsearch 5.5 instead of 5.4.
* Updated the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell/blob/master/izmjene-u-rje%C4%8Dniku.md) dictionary to version 2.1.1.

## Release v2.0.0

* Added Bash scripts to automate future dictionary building, testing and updating.
* Set up the [Travis CI](https://travis-ci.org/) build server to test dictionary integrations with Elasticsearch 1.7, 2.4 and 5.4 versions.
* The dictionary is now sourced from the [krunose/hr-hunspell](https://github.com/krunose/hr-hunspell) repository.

## Release v1.0.0

* This is the initial release.
