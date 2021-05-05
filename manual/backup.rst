Backuping and Restoring Pontoon
===============================

What to Backup?
---------------

You have to backup the following elements:

* The database (you can make an SQL dump of your db),
* The Pontoon's configuration: ``/etc/opt/pontoon.env``,
* The Pontoon's SSH keys folder: ``/var/opt/pontoon/.ssh/``

You may be tempted to backup the media folder (``/var/opt/pontoon/media``) but
it only contains cloned Git repositories, so they can be cloned again...


Backuping Pontoon
-----------------

Backuping Files
~~~~~~~~~~~~~~~

Just copy the ``/etc/opt/pontoon.env`` file and the ``/var/opt/pontoon/.ssh/``
folder.


Backuping the Database
~~~~~~~~~~~~~~~~~~~~~~

To backup the database, fist login as the ``postgres`` user::

    su postgres

Then dump the database::

    pg_dump pontoondb > /tmp/pontoondb.dump.sql

Where:

* ``pontoondb`` is the name of the database,
* ``/tmp/pontoondb.dump.sql`` is a file where the dump will be written.


Restoring a Pontoon
-------------------

.. IMPORTANT::

    Be sure have the exact same version of Pontoon installed than the one you
    backuped. Follow the installation guide if you need to make a fresh
    install:

    * :doc:`./install/index`


Restoring Files
~~~~~~~~~~~~~~~

Just copy back the ``/etc/opt/pontoon.env`` file and the
``/var/opt/pontoon/.ssh/`` folder.


.. NOTE::

   The ``/var/opt/pontoon/.ssh/`` folder must be owned by the ``pontoon`` user and have ``0700`` as permissions. You can fix both with the following commands::

       chown -R pontoon:pontoon /var/opt/pontoon/.ssh/
       chmod 700 /var/opt/pontoon/.ssh/


Restoring the Database
~~~~~~~~~~~~~~~~~~~~~~

Clearing the Database
^^^^^^^^^^^^^^^^^^^^^

The database must be empty before restoring. The simplest way to achieve this is to drop the entire database and to recreate it.

To drop the database, first login to the ``postgres`` account::

    su postgres

then open the PostgreSQL shell::

    psql

and execute the following query::

    DROP DATABASE pontoondb;

Where:

* ``pontoondb`` is the name of the database,

Then create the database again following the :doc:`./install/postgresql` installation page of the manual.


Restoring the Dump
^^^^^^^^^^^^^^^^^^

First login to the ``postgres`` account::

    su postgres

Then restore the dump with the following command::

    psql pontoondb < /tmp/pontoondb.dump.sql

Where:

* ``pontoondb`` is the name of the database,
* ``/tmp/pontoondb.dump.sql`` is the path of the SQL dump to restore.
