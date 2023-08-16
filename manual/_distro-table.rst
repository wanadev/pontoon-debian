+--------------------------+--------+------------+-----------------------------+
| Distribution             | Python | PostgreSQL | Distribution End of Support |
+==========================+========+============+=============================+
| Debian 11 (bullseye)     | 3.9    | 13         | → 2026-06                   |
+--------------------------+--------+------------+-----------------------------+
| Debian 12 (bookworm)     | 3.11   | 15         | → 2028-06                   |
+--------------------------+--------+------------+-----------------------------+
| Ubuntu 22.04 LTS (jammy) | 3.10   | 14         | → 2027-04                   |
+--------------------------+--------+------------+-----------------------------+

.. WARNING::

   Ubuntu 20.04 LTS (focal) is not supported anymore: some Python packages used
   by Pontoon now require Python >= 3.9.

.. NOTE::

   Please note that the "end of support" date is the end of the Linux
   distribution support, not the date until when Pontoon will be maintained on
   this system: if Pontoon's developers stop supporting Python or PostgreSQL
   versions available on those platforms, the support will be dropped for newer
   releases.
