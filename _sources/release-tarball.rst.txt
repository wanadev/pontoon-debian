Getting Pontoon
===============

We provide both:

* Prebuilt Pontoon tarball releases,
* and scripts to build your own Pontoon releases.


Prebuilt Pontoon Debian Tarball
-------------------------------

The simplest way to get Pontoon is to download the prebuilt tarballs. You will
find them on our Github release page:

* https://github.com/wanadev/pontoon-debian/releases


Building Pontoon Debian Tarball
-------------------------------

First install some dependencies::

    sudo apt install git python3 python3-dev python3-venv nodejs npm

Then clone the Git repository and navigate to it::

    clone https://github.com/wanadev/pontoon-debian.git
    cd pontoon-debian

Finaly build the tarball with the following command::

    ./make-pontoon-tarball.sh [PONTOON_REV [VERSION]]

Where

* ``PONTOON_REV`` is any valid revision or reference in the Pontoon's
  repository (e.g. ``master``, ``87697b7b``,...)

* ``VERSION`` is a version number for your release tarball (e.g. ``0.0.0.0``,
  ``2021.05.05.0``,...)

Example::

    ./make-pontoon-tarball.sh master 0.0.0.0

The output goes to ``dist/pontoon_<VERSION>.tar.gz``.
