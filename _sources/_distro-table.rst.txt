+-------------------------------------+--------+------------+-----------------------------+
| Distribution                        | Python | PostgreSQL | Distribution End of Support |
+=====================================+========+============+=============================+
| Debian 11 (bullseye)                | 3.9    | 13         | → 2026-06                   |
+-------------------------------------+--------+------------+-----------------------------+
| [EXPERIMENTAL] Debian 12 (bookworm) | 3.11   | 15         | → ?                         |
+-------------------------------------+--------+------------+-----------------------------+
| Ubuntu 20.04 LTS (focal)            | 3.8    | 12         | → 2025-04                   |
+-------------------------------------+--------+------------+-----------------------------+
| Ubuntu 22.04 LTS (jammy)            | 3.10   | 14         | → 2027-04                   |
+-------------------------------------+--------+------------+-----------------------------+

.. WARNING::

   Debian 10 (buster) and Ubuntu 18.04 (bionic) are not supported anymore: some
   Python packages used by Pontoon now require Python >= 3.8.

.. WARNING::

    Debian 12 (bookworm) support is experimental. I had issue compiling
    psycopg2 on this platform.

.. NOTE::

    Please note that the "end of support" date is the end of the Linux
    distribution support, not the date until when Pontoon will be maintained on
    this system: if Pontoon's developers stop supporting Python or PostgreSQL
    versions available on those platforms, the support will be dropped for newer
    releases.
