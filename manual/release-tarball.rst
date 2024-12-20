Getting Pontoon
===============

We provide both:

* Prebuilt Pontoon tarball releases,
* and scripts to build your own Pontoon releases.


Prebuilt Pontoon Debian Tarball
-------------------------------

The simplest way to get Pontoon is to download the prebuilt tarballs.

We have two types of prebuilt tarball releases:

* "stable" releases,
* and nightly builds.

The "stable" releases are built from Pontoon's ``main`` and are then tested on our side and the migration from the previous stable release is documented. This is the recommended versions to use in production. To download the "stable" releases, go to our release page on GitHub:

* https://github.com/wanadev/pontoon-debian/releases

The nightly builds are automatically generated every night and are not tested nor documented. They should be used only for testing purpose. You will find nightly builds as artifacts of the GitHub Actions pipelines :

* https://github.com/wanadev/pontoon-debian/actions/workflows/pontoon-tarball.yml

.. NOTE::

   * You can only download nightly builds from the last 14 days.
   * You must be connected to your GitHub account to download artifacts.


Building Pontoon Debian Tarball
-------------------------------

Requirements:

* Debian 12 or Ubuntu 24.04 (Ubuntu 22.04 will also work but only with an updated Node.js version)
* Python >= 3.10 (3.11 recommanded)
* Node.js >= 18

First install some dependencies::

    sudo apt install build-essential postgresql-server-dev-all git python3 python3-dev python3-venv nodejs npm

Then clone the Git repository and navigate to it::

    clone https://github.com/wanadev/pontoon-debian.git
    cd pontoon-debian

Finaly build the tarball with the following command::

    ./make-pontoon-tarball.sh [PONTOON_REV [VERSION]]

Where

* ``PONTOON_REV`` is any valid revision or reference in the Pontoon's
  repository (e.g. ``main``, ``87697b7b``,...)

* ``VERSION`` is a version number for your release tarball (e.g. ``0.0.0.0``,
  ``2021.05.05.0``,...)

Example::

    ./make-pontoon-tarball.sh main 0.0.0.0

The output goes to ``dist/pontoon_<VERSION>.tar.gz``.


Building Pontoon Debian Tarball using Docker
--------------------------------------------

You can build the Pontoon Debian tarball from the **latest commit of Pontoon's
main branch** using Docker. To do so, run::

    ./make-pontoon-tarball-docker.sh
