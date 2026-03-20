Pontoon Debian v2026.03.20
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2025.11.05`
* Built from commit: `403b44ca0d944948391c66cf6604b6ec10fac942 <https://github.com/mozilla/pontoon/commit/403b44ca0d944948391c66cf6604b6ec10fac942>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2026.03.20.0/pontoon_2026.03.20.0.tar.gz


Migration Instructions
----------------------

There is no specific migration instruction, just follow the :doc:`./migration`.


Changelog
---------

⚠️ Breaking changes
~~~~~~~~~~~~~~~~~~~

Ubuntu 22.04 no more supported:

* Pontoon dependencies are no more compatible with Python 3.10.

GraphQL API removed:

* See `PR #3825 <https://github.com/mozilla/pontoon/pull/3825>`__
* Replacement: `REST API v2 documentation <https://github.com/mozilla/pontoon/blob/99e4b86/pontoon/api/README.md>`__

Last part of REST API v1 removed:

* See `PR #3837 <https://github.com/mozilla/pontoon/pull/3837>`__
* Replacement: `REST API v2 documentation <https://github.com/mozilla/pontoon/blob/99e4b86/pontoon/api/README.md>`__

Raygun support removed from Pontoon, ``RAYGUN_APIKEY`` setting removed from config.

* See `issue #3919 <https://github.com/mozilla/pontoon/issues/3919>`__


Important changes
~~~~~~~~~~~~~~~~~

New settings available:

.. code-block:: sh

    # If using a reverse proxy, set to "True" to make django-allauth redirect_url
    # work as expected.  Default value is "False".
    USE_X_FORWARDED_HOST=False

    # Path to a Google Cloud service account JSON key file used by Google client
    # libraries for authentication (optional).
    GOOGLE_APPLICATION_CREDENTIALS=


All changes
~~~~~~~~~~~

https://github.com/mozilla/pontoon/compare/fdd4dd1d9bc4dd407b563fe1bc21cd479a5d2b7a...403b44ca0d944948391c66cf6604b6ec10fac942
