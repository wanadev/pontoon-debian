Migration Guide
===============

This page contains generic migration instructions. Please read the
version-specific page to check if there are special instructions to migrate to
this version.

.. WARNING::

   When upgrading Pontoon Debian from a version to another one, prefer
   migrating from a version to the next one without skipping any intermediate
   version. While it could work, this is an untested migration path.


1. Stop Pontoon Service
-----------------------

The first thing to do before starting the migration is to stop the Pontoon
service::

    systemctl stop pontoon


2. Backup the Database
----------------------

Once Pontoon stopped, backup the database to be able to rollback if anything
wrong happens. Follow instruction from the backup guide:

* :doc:`../backup`


3. Download, Extract and Install the New Release
------------------------------------------------

First download the Pontoon release you want to migrate to::

    cd /opt/pontoon
    wget https://github.com/wanadev/pontoon-debian/releases/download/vXXXX.XX.XX.X/pontoon_XXXX.XX.XX.X.tar.gz

See :doc:`../release-tarball` for more information.

Once the download finished, extract the Pontoon release and update the symbolic
link::

    tar -xvzf pontoon_XXXX.XX.XX.X.tar.gz
    rm current
    ln -s pontoon-XXXX.XX.XX.X/ current

Then go to the ``current/`` folder::

    cd current/

And rebuild the symbolic link to the ``media/`` folder::

    ln -s /var/opt/pontoon/media /opt/pontoon/current/media
    chown pontoon:pontoon /opt/pontoon/current/media

Finally, create the virtualenv::

    python3 -m venv __env__
    source __env__/bin/activate
    pip install --upgrade pip

And install the dependencies::

    pip install -r requirements.txt        # Python >= 3.11
    pip install -r requirements.py310.txt  # Python 3.10 (Ubuntu 22.04)

.. WARNING::

   Since Python 3.12, you also need to install ``setuptools`` by hand in the
   virtualenv::

       pip install setuptools  # Python >= 3.12 (Ubuntu 24.04)


4. Migrate the Database
-----------------------

Once the new Pontoon release installed, the database must be migrated using the
following commands::

    export DOTENV_PATH=/etc/opt/pontoon.env
    python manage.py migrate


5. Restart the Pontoon Service
------------------------------

If everything is ok, you can now restart your Pontoon service::

    systemctl start pontoon


Rollback
--------

If something goes wrong during the migration, you can rollback to the
previously installed Pontoon version.

Stop the Pontoon service::

    systemctl stop pontoon

Update the ``current/`` symbolic link::

    cd /opt/pontoon
    rm current
    ln -s pontoon-XXXX.XX.XX.X/ current   # where XXX.XX.XX.X is the previous version

Restore the backup of your database following the instruction from the backup
guide:

* :doc:`../backup`

Restart the Pontoon service::

    systemctl start pontoon
