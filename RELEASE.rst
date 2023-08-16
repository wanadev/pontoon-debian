Things to do when releasing a new version
=========================================

This file is a memo for the maintainer.


0. Check and Tests
------------------

* Check the nightly CI for compatibility issue with Python and PostgreSQL
  versions.
* Check all commits from previous version to search for important changes
  (changed config, new/removed feature,...) and for breaking changes.
* Check and Update the manual depending on the change.
* Update supported disto if required.
* Build the tarball (``./make-pontoon-tarball-docker.sh``) and test DB migrations
  from previous version in a VM.


1. Release
----------

* Create the version page and migration instructions in
  ``./manual/migration/pontoon-vYYYY-MM-DD.rst``.
* Update the ToC in ``./manual/migration/index.rst``.
* Commit / tag (``git commit -m vYYYY.MM.DD.0 && git tag vYYYY.MM.DD.0 && git push && git push --tags``)


2. Publish Github Release
-------------------------

* Make a release on Github
* Add changelog
* Add the release tarball (``pontoon_YYYY.MM.DD.0.tar.gz``)
