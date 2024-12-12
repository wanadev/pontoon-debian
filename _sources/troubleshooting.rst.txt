Troubleshooting
===============

Errors about unpinned modules during pip install
------------------------------------------------

When you install Pontoon dependencies using ``pip install -r requirements.txt``,
you may encounter errors similar to this one::

    ERROR: In --require-hashes mode, all requirements must have their versions pinned with ==. These do not:
        googleapis-common-protos<2.0.dev0,>=1.56.2 from https://files.pythonhosted.org/packages/a0/0f/c0713fb2b3d28af4b2fded3291df1c4d4f79a00d15c2374a9e010870016c/googleapis_common_protos-1.66.0-py2.py3-none-any.whl (from google-api-core[grpc]==2.20.0->-r requirements/default.txt (line 369))

This can be caused by a not up to date pip. In this case try to update the pip
version inside the virtualenv::

    /opt/pontoon/current/__env__/bin/pip install --upgrade pip

Some Python versions also requires specific dependencies. Check in the Pontoon
folder if there is a ``requirements.pyXYY.txt`` file specific to your Python
version. For example, if you are using Python 3.10, you should install
dependencies from ``requirements.py310.txt``::

    pip install -r requirements.py310.txt  # Python 3.10

Finally, note that only CPython versions listed in the compatibility table are
supported:

* :doc:`./install/requirements`


Missing "distutils" module when running "manage.py" commands
------------------------------------------------------------

If you are using Python 3.12 and above, Django may complain about missing ``distutils`` module when running ``manage.py`` commands, displaying errors like this::

    Traceback (most recent call last):
        [...]
        from distutils.version import \
    ModuleNotFoundError: No module named 'distutils'

In this happen, install the ``setuptools`` package to the virtualenv::

    /opt/pontoon/current/__env__/bin/pip install setuptools


Permission issue on database migration (psycopg2 permission denied)
-------------------------------------------------------------------

When running ``python manage.py migrate`` to create or update the database schema, you may encounter the following error::

    Operations to perform:
      Apply all migrations: account, actionlog, admin, auth, base, checks, contenttypes, guardian, homepage, insights, messaging, notifications, sessions, sites, socialaccount, sync, tags, terminology, tour, uxactionlog
    Running migrations:
    Traceback (most recent call last):
      File "/opt/pontoon/pontoon-2024.12.11.0/__env__/lib/python3.12/site-packages/django/db/backends/utils.py", line 87, in _execute
        return self.cursor.execute(sql)
               ^^^^^^^^^^^^^^^^^^^^^^^^
    psycopg2.errors.InsufficientPrivilege: permission denied for schema public
    LINE 1: CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIM...

Since PostgreSQL 15, granting permissions to an user seems to not be sufficient so you should change the database's ownership to the user used by Pontoon:

.. code-block:: SQL

    ALTER DATABASE pontoondb OWNER TO pontoonuser;

Where:

* ``pontoondb`` is the name of the database,
* ``pontoonuser`` is the name of the user.
