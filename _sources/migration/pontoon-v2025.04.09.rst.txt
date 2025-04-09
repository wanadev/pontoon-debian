Pontoon Debian v2025.04.09
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2024.12.13`
* Built from commit: `bdd74fadddb23386f8a13cdb540d22538a136fa2 <https://github.com/mozilla/pontoon/commit/bdd74fadddb23386f8a13cdb540d22538a136fa2>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2025.04.09.0/pontoon_2025.04.09.0.tar.gz


Migration Instructions
----------------------

If you are making requests to Pontoon from origins that are different from the
one where app is available, You should add the ``CSRF_TRUSTED_ORIGINS``
variable to your ``pontoon.env`` config before migrating::

    CSRF_TRUSTED_ORIGINS=https://pontoon.example.org,https://myotherorigin.example.org

Then you can follow the standard :doc:`./migration` instructions.

.. WARNING::

   **Database migration:** The ``sync.0004_migrate_sync_events`` step of the database migration may take A LOT of time if you have many sync events in your database. Please also note that it may require a lot more RAM during the migration than Pontoon needs when it is running.

   On our own (relatively small) instances, it took a couple of hours and required 2 GB of RAM along to 4 GB of swap to complete!


Changelog
---------

⚠️ Breaking changes
~~~~~~~~~~~~~~~~~~~

* SVN Support dropped, ``SVN_LD_LIBRARY_PATH`` option removed


Important changes
~~~~~~~~~~~~~~~~~

New settings are available.

Web settings:

.. code-block:: sh

    # If True, redirects all non-HTTPS requests to HTTPS
    SECURE_SSL_REDIRECT=True

    # A list of trusted origins for unsafe requests.
    #
    # /!\ IF SET, IT SHOULD ALSO CONTAIN THE DOMAINS WHERE THE APP IS AVAILABLE.
    #
    # The setting also supports subdomains, so you could add `https://*.example.com`,
    # for example, to allow access from all subdomains of `example.com`. Multiple
    # domains must be separated by a comma: `https://example1.com,https://example2.com`.
    #
    # See: https://docs.djangoproject.com/en/5.1/ref/settings/#csrf-trusted-origins
    CSRF_TRUSTED_ORIGINS=

Database settings::

    # Controls if the database needs a secure connection with the app
    DATABASE_SSLMODE=True



All changes
~~~~~~~~~~~

https://github.com/mozilla/pontoon/compare/5e90a8ac1ed8b5b6915156cf868534988b650cb3...bdd74fadddb23386f8a13cdb540d22538a136fa2
