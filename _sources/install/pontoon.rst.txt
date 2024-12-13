Pontoon
=======

In this section we will see how to install and configure Pontoon. The main
paths and users involved in the installation are:

* ``pontoon`` user: the system user that will run Pontoon.
* ``/opt/pontoon/current``: the path where the latest Pontoon version will be
  installed with all its dependencies self-contained in a *virtualenv*.
* ``/var/opt/pontoon``: the path where the Pontoon's data will be stored
  (cloned repositories, SSH keys,...)
* ``/etc/opt/pontoon.env``: the path of the Pontoon's configuration file.

Feel free the change those paths to fit your requirements but be aware that
this manual and the sample configurations provided with it assume they are left
unchanged.


Installing Pontoon
------------------

System Preparation
~~~~~~~~~~~~~~~~~~

First we have to create the ``pontoon`` user that will be used to run Pontoon::

    useradd -r -m -s /bin/bash -d /var/opt/pontoon pontoon

And we install some system dependencies::

    apt install git build-essential python3 python3-dev python3-venv postgresql-server-dev-all

Then we create the ``/opt/pontoon`` folder that we will need for the
installation and go into it::

    mkdir /opt/pontoon
    cd /opt/pontoon


Downloading and Extracting Pontoon
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now we can download the latest version of the Pontoon Debian's releases (you
can, of course, use your own builds here). You will find the releases on Github:

* https://github.com/wanadev/pontoon-debian/releases

To download a release on the server you can use ``wget``::

    wget https://github.com/wanadev/pontoon-debian/releases/download/vXXXX.XX.XX.X/pontoon_XXXX.XX.XX.X.tar.gz

Once downloaded, we can extract the archive::

    tar -xvzf pontoon_XXXX.XX.XX.X.tar.gz

This will extract a folder named ``pontoon-XXXX.XX.XX.X``.

We will now make a symbolic link named ``current`` that points on it in order
to always have ``/opt/pontoon/current`` pointing on the latest Pontoon
version::

    ln -s pontoon-XXXX.XX.XX.X/ current


Virtualenv Creation and Activation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now we will create the *virtualenv* where all Pontoon's dependencies will be
installed.

First we go in the Pontoon's installation directory::

    cd /opt/pontoon/current

Then we create the *virtualenv*::

    python3 -m venv __env__

Once the *virtualenv* created, we should "activate" it to use it. This can be
achieved with the following command::

    source __env__/bin/activate

If the *virtualenv* was successfully activated, your prompt should now be
prefixed by ``(__env__)``.

.. NOTE::

   Later in this manual, you will have to run commands with this *virtualenv*
   activated. You will just have to repeat the ``cd /etc/pontoon/current &&
   source __env__/bin/activate`` commands to do achieve this.

.. NOTE::

   If you want to leave the *virtualenv*, just use the ``deactivate`` command.
   You will be able to activate it again with the ``cd /opt/pontoon/current &&
   source __env__/bin/activate`` commands.


Installing Pontoon's Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the dependencies, you should run the following commands from within
the *virtualenv* (see above).

First we will **update pip**, the Python's package manager (with an older *pip*
version, you may have to compile additional dependencies or have wrong
dependency resolution)::

    pip install --upgrade pip

Then we can install Pontoon's dependencies with **ONE** of the following
commands::

    pip install -r requirements.txt        # Python >= 3.11
    pip install -r requirements.py310.txt  # Python 3.10 (Ubuntu 22.04)

.. WARNING::

   Since Python 3.12, you also need to install ``setuptools`` by hand in the
   virtualenv::

       pip install setuptools  # Python >= 3.12 (Ubuntu 24.04)


Temporary Fix: The "media" Folder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Despite a configurable path for the media folder, Pontoon currently stores its
data in a ``media/`` folder next to its ``pontoon/`` folder. To avoid having
data in the ``/opt`` directory, we will make a symbolic link to store the data
in ``/var``::

    mkdir /var/opt/pontoon/media
    chown pontoon:pontoon /var/opt/pontoon/media
    ln -s /var/opt/pontoon/media /opt/pontoon/current/media
    chown pontoon:pontoon /opt/pontoon/current/media

This may be fixed in the future. :)


Configuring Pontoon
-------------------

Now that Pontoon is installed, we will configure it.

We made a sample configuration file that is available in the ``debian/``
folder. You can copy it into the ``/etc/opt`` folder with the following
command::

    cp /opt/pontoon/current/debian/pontoon.env /etc/opt


Minimal Configuration
~~~~~~~~~~~~~~~~~~~~~

To allow Pontoon to run, you will have to configure at least the following
settings:

* ``SITE_URL``: The base URL for the Pontoon installation. Please note that the
  use of **TLS (HTTPS) is not optional**.

  Example::

      SITE_URL=https://pontoon.example.com

* ``SECRET_KEY``: A random key that will be used to encrypt cookies. If this
  key is changed, all session cookies will be invalidated.

  Example::

      SECRET_KEY=2m711TDbINHAuBGEB8lCxtQXEpPkFPNWDsLGJsiWlAyf2SPQ7YQj1wRTFhILCvjq

  .. WARNING::

     Do not copy the example key. Your key **MUST REMAIN SECRET**!

* ``DATABASE_URL``: The URL containing all the information to connect to the
  database. It is composed as follow::

      postgres://<USER>:<PASSWORD>@<HOST>/<DATABASE>

  Example::

      DATABASE_URL=postgres://pontoonuser:pontoonpassword@localhost/pontoondb


Git SSH Configuration
~~~~~~~~~~~~~~~~~~~~~

If you are using Git, you will have to create and configure an SSH key to allow
Pontoon to ``clone`` and ``push`` to your repositories.

We will proceed with the following steps:

1. create an SSH key for Pontoon,
2. configure Pontoon to use it,
3. create a user for Pontoon on the Git server,
4. configure its public key,
5. initiate the first connection between our server and the Git server.

First we can create the Pontoon's SSH key with the following command::

    su pontoon -c "ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519"

You should now have two files in ``/var/opt/pontoon/.ssh``:

* ``id_ed25519``: The private SSH key that will be used locally by Git,
* ``id_ed25519.pub``: The public key you will have to configure on your Git server
  (GitLab, GitHub,...).

To allow Git to use our newly generated key we should uncomment and configure
the ``GIT_SSH_COMMAND`` setting in the ``/etc/opt/pontoon.env`` file::

    GIT_SSH_COMMAND="ssh -v -i /var/opt/pontoon/.ssh/id_ed25519"

Then you will have to create an user on you Git server (GitLab, GitHub,...) and
to add the Pontoon's public SSH key (``/var/opt/pontoon/.ssh/id_ed25519.pub``) to
it.

Once the user created and the key added, you should initiate a first SSH
connection to the Git server to add it to the known hosts::

    su pontoon
    ssh -i ~/.ssh/id_ed25519 git@git.example.org

Where:

* ``git@git.example.org`` is your Git server user and host.

SSH should ask you if you are sure that you want to connect to this server...
Just answer by typing ``yes<Enter>``::

    The authenticity of host 'git.example.org (XXX.XXX.XXX.XXX)' can't be established.
    ECDSA key fingerprint is SHA256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.
    Are you sure you want to continue connecting (yes/no/[fingerprint])?

.. NOTE::

   If now the server is asking you for a password, that means the public key is
   not well configured on the user.

You can now leave from the ``pontoon`` using the ``exit`` command.


Other Configurations
~~~~~~~~~~~~~~~~~~~~

There are a lot of other configurations you will want to set. You will find
them all in the sample configuration file:

* https://github.com/wanadev/pontoon-debian/blob/master/debian/pontoon.env

You will also find some information in Pontoon's manual:

* https://mozilla-pontoon.readthedocs.io/en/latest/admin/deployment.html#environment-variables

.. NOTE::

   If you are using Mercurial or SVN, please consider contributing this manual.


Populating the Database
-----------------------

We can now populate the database with Pontoon's tables and data.

To populate the database, you should be in the Pontoon's installation folder
(``/opt/pontoon/current``) and have its *virtualenv* activated. This can be
achieved with the following commands::

    cd /opt/pontoon/current && source __env__/bin/activate

You should also define the ``DOTENV_PATH`` environment variable with the path
to the Pontoon's configuration::

    export DOTENV_PATH=/etc/opt/pontoon.env

Once this is done, just run the following command to populate the database::

    python manage.py migrate


.. _create_django_admin_user:

Creating the Initial Administrator User
---------------------------------------

Now that the database is ready, we can create the first administrator user.

.. NOTE::

    You should be in the Pontoon's installation folder, with is *virtualenv*
    activated, and you should have the ``DOTENV_PATH`` environment variable
    defined like in the previous step.

To create the user, simply run the following command::

    python manage.py createsuperuser --user=admin --email=admin@example.org

Where:

* ``admin`` is the name of the user,
* ``admin@example.org`` is the email of the user¹.

.. IMPORTANT::

   ¹ If you want to use local ``django`` accounts, you can put your real email
   here.

   If you plan to use an alternative authentication method (``fxa``,
   ``github``, ``gitlab``, ``google``,...) **DO NOT** put the email addresse of
   a future user here, else he will not be able to login; you can just put
   a random email addresse for this administrator account, it will never be
   used anyway.
