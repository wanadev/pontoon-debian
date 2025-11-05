Pontoon Debian v2025.11.05
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2025.04.09`
* Built from commit: `fdd4dd1d9bc4dd407b563fe1bc21cd479a5d2b7a <https://github.com/mozilla/pontoon/commit/fdd4dd1d9bc4dd407b563fe1bc21cd479a5d2b7a>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2025.11.05.0/pontoon_2025.11.05.0.tar.gz


Migration Instructions
----------------------

There is no specific migration instruction, just follow the :doc:`./migration`.


Changelog
---------

⚠️ Breaking changes
~~~~~~~~~~~~~~~~~~~

* Dropped ``.inc`` file format support (see `PR #3711 <https://github.com/mozilla/pontoon/pull/3711>`__).


Important changes
~~~~~~~~~~~~~~~~~

New settings available:

.. code-block:: sh

    DJANGO_DEBUG_TOOLBAR=False

A new REST API was added:

* See `PR #3666 <https://github.com/mozilla/pontoon/pull/3666>`__
* and `REST API documentation <https://github.com/mozilla/pontoon/blob/fdd4dd1/pontoon/api/README.md#rest-api-beta>`__

⚠️ The GraphQL API is now deprecated:

* See `PR #3756 <https://github.com/mozilla/pontoon/pull/3756>`__
* and `discussion #3745 <https://github.com/mozilla/pontoon/discussions/3745>`__


All changes
~~~~~~~~~~~

https://github.com/mozilla/pontoon/compare/bdd74fadddb23386f8a13cdb540d22538a136fa2...fdd4dd1d9bc4dd407b563fe1bc21cd479a5d2b7a
