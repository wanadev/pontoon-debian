Pontoon Debian patches
======================

Making a patch:

* Generate a release tar, extract it and copy the result folder::

    # ... generate the achive ...
    tar -xvzf -xvzf pontoon_YYYY.MM.DD.N.tar.gz
    cp -r pontoon-YYYY.MM.DD.N pontoon-YYYY.MM.DD.N-patched/

* Make changes in ``pontoon-YYYY.MM.DD.N-patched/``

* Make the patch (from the parent directory of the Git repos)::

    diff -ruN pontoon-YYYY.MM.DD.N/ pontoon-YYYY.MM.DD.N-patched/ > YYYYMMDD_NN_my_patch.patch

* Copy the patch in the ``debian/patches/`` folder

* Finally rebuild the script to generate the archive, all patches will be applyied in alphabetical order.
