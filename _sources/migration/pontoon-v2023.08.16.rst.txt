Pontoon Debian v2023.08.16
==========================

Release Details
---------------

* Migration from: :doc:`./pontoon-v2023.05.02`
* Built from commit: `e1f165217cb80a4b7df4a0f197a186716a95453f <https://github.com/mozilla/pontoon/commit/e1f165217cb80a4b7df4a0f197a186716a95453f>`_
* Tarball URL: https://github.com/wanadev/pontoon-debian/releases/download/v2023.08.16.0/pontoon_2023.08.16.0.tar.gz


Migration Instructions
----------------------

There is no specific migration instruction, just follow the :doc:`./migration`.


Changelog
---------

.. WARNING::

   **BREAKING CHANGE:** Python 3.8 is no more supported by Pontoon.

   * If you are using Ubuntu 20.04 (bionic), you will not be able to migrate!

   * If you have multiple Python version on your system, be careful to use the
     right one.

Important changes:

* Keycloak_ was added to supported authentication method (`#2820 <https://github.com/mozilla/pontoon/pull/2820>`__).
* The ``LOCALE_REQUEST_FROM_EMAIL`` setting was replaced by ``DEFAULT_FROM_EMAIL``. Update your ``pontoon.env`` file if you use this setting!
* Python 3.11 is now supported, this enable Debian 12 Bookworm support too (`#2906 <https://github.com/mozilla/pontoon/pull/2906>`__, `#2916 <https://github.com/mozilla/pontoon/pull/2916>`__).
* Python 3.8 is not supported anymore. Do not update if you still use this version!

All changes:

https://github.com/mozilla/pontoon/compare/d470fd7da0542e000aabfa90a8480a7a07fc4287...e1f165217cb80a4b7df4a0f197a186716a95453f

.. _Keycloak: https://www.keycloak.org/
