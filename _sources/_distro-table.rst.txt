+---------------------------+----------+------------+-----------------------------+
| Distribution              | Python   | PostgreSQL | Distribution End of Support |
+===========================+==========+============+=============================+
| Debian 10 (buster)        | 3.7      | 11         | → 2024-06                   |
+---------------------------+----------+------------+-----------------------------+
| Debian 11 (bullseye)      | 3.9      | 13         | → 2026-06                   |
+---------------------------+----------+------------+-----------------------------+
| Ubuntu 18.04 LTS (bionic) | 3.7      | 10         | → 2023-04                   |
+---------------------------+----------+------------+-----------------------------+
| Ubuntu 20.04 LTS (focal)  | 3.8      | 12         | → 2025-04                   |
+---------------------------+----------+------------+-----------------------------+

.. IMPORTANT::

    Ubuntu 22.04 LTS (jammy) is not supported yet: Pontoon does not work with
    Python 3.10 (see `#2493
    <https://github.com/mozilla/pontoon/issues/2493>`_).

.. NOTE::

    Please note that the "end of support" date is the end of the Linux
    distribution support, not the date until when Pontoon will be maintained on
    this system: if Pontoon's developers stop supporting Python or PostgreSQL
    versions available on those platforms, the support will be dropped for newer
    releases.
