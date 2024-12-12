PostgreSQL
==========

Pontoon uses a PostgreSQL database to store its data. The PostgreSQL database
can be installed on the same host as Pontoon or on a separated one depending
on your own requirements.

.. IMPORTANT::

   In this manual we will assume that everything is installed on the same host
   for simplicity's sake.


Installing PostgreSQL
---------------------

First we have to install both PostgreSQL server and client. This can be
achieved with the following command::

    apt install postgresql postgresql-client


Connecting to the PostgreSQL Console
------------------------------------

To access the PostgreSQL console, you first need to log into the ``postgres``
system account::

    su postgres

Then you can access to the PostgreSQL console with the following command::

    psql


Creating the Pontoon's Database
-------------------------------

To create the Pontoon's database you can use the following query:

.. code-block:: SQL

    CREATE DATABASE pontoondb;

Where:

* ``pontoondb`` is the name of the database.

Pontoon needs the ``fuzzystrmatch`` extension to be available in its database.
To add it, first connect to the database with the following command::

    \c pontoondb

Where:

* ``pontoondb`` is the name of the database.

Then create the extension with the following query:

.. code-block:: SQL

    CREATE EXTENSION "fuzzystrmatch";


Creating the Pontoon's User
---------------------------

Pontoon will need an user to connect to its database. Here is the SQL query to
create it:

.. code-block:: SQL

    CREATE ROLE pontoonuser LOGIN PASSWORD 'pontoonpassword';

Where:

* ``pontoonuser`` is the name of the user,
* ``pontoonpassword`` is the password of the user.

Then we should grant all privileges to this user on the database with the
following query:

.. code-block:: SQL

    GRANT ALL PRIVILEGES ON DATABASE pontoondb TO pontoonuser;

Where:

* ``pontoondb`` is the name of the database,
* ``pontoonuser`` is the name of the user.


.. WARNING::

   Since PostgreSQL 15 (Debian >= 12, Ubuntu >= 24.04), the grant is not
   sufficient and the user must also be set as the owner of the database:

   .. code-block:: SQL

      ALTER DATABASE pontoondb OWNER TO pontoonuser;

   Where:

   * ``pontoondb`` is the name of the database,
   * ``pontoonuser`` is the name of the user.

You can now:

* exit the PostgreSQL console with the ``\q`` command,
* and disconnect from the ``postgres`` user with the ``exit`` command.
