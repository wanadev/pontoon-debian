Foreword
========


What is Pontoon?
----------------

From Pontoon's repository:

    **Pontoon** is a **translation management system** used and developed by
    the Mozilla localization community. It specializes in open source
    localization that is driven by the community and uses version-control
    systems for storing translations.

Official Pontoon repository on Github:

* https://github.com/mozilla/pontoon

Official Pontoon documentation:

* https://mozilla-pontoon.readthedocs.io/en/latest/

Pontoon instance used to translate Firefox and other Mozilla's projects:

* https://pontoon.mozilla.org/


What is Pontoon Debian?
-----------------------

**Pontoon Debian** is a project providing :

* **A Pontoon distribution** to help install it on Debian and Ubuntu systems.
  It consists of:

  * **Releases**: Pontoon is a project in constant evolution that is deployed
    using continuous integration on Mozilla's Heroku servers. This makes it
    difficult to maintain on a self-hosted server, so we chose to make releases
    with a defined set of new features / fixes in them, and to document the
    migration between two versions of our releases.

  * **Prebuit tarballs**: Pontoon versions that we build and release on
    a regular basis.

  * **Build scripts**: The scripts to build your own Pontoon versions.

  * **Sample configuration files** for Pontoon, systemd, Nginx,...

* **A manual** (the one you are reading) to help administrators to install and
  maintain Pontoon on Debian and Ubuntu.

Each Pontoon version we release are automatically tested on a matrix of
different distributions, Python and PostgreSQL versions (see below).


Targeted Systems
----------------

Pontoon Debian currently targets the following systems:

+---------------------------+-----------------------------+----------+------------+
| Distribution              | Distribution End of Support | Python   | PostgreSQL |
+===========================+=============================+==========+============+
| Debian 10 (buster)        | → 2024-06                   | 3.7      | 11         |
+---------------------------+-----------------------------+----------+------------+
| Debian 11 (bullseye)      | → ?                         | 3.9      | 13         |
+---------------------------+-----------------------------+----------+------------+
| Ubuntu 18.04 LTS (bionic) | → 2023-04                   | 3.6, 3.7 | 10         |
+---------------------------+-----------------------------+----------+------------+
| Ubuntu 20.04 LTS (focal)  | → 2025-04                   | 3.8      | 12         |
+---------------------------+-----------------------------+----------+------------+
| Ubuntu 20.10 (groovy)     | → 2021-07                   | 3.8, 3.9 | 12         |
+---------------------------+-----------------------------+----------+------------+
| Ubuntu 21.04 (hirsute)    | → 2022-01                   | 3.9      | 13         |
+---------------------------+-----------------------------+----------+------------+

.. NOTE::

    Please note that the "end of support" date is the end of the Linux
    distribution support, not the date until when Pontoon will be maintained on
    this system: if Pontoon's developers stop supporting Python or PostgreSQL
    versions available on those platforms, the support will be dropped for newer
    releases.


Warranty
--------

We made this project for our own needs and we shared it in the hope that it
will be useful. **It is provided "as is", without any warranty**. We are not
liable to you for any damage or data loss you encounter by following the
instructions of this manual or by using our scripts and releases.

Also please note that we may stop working on this project at any time, and that
we may not answer support requests.
