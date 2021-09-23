Contributing
============

Questions
---------

If you have questions about installing Pontoon on Debian or Ubuntu, you can contact us:

* by opening `an issue on Github <https://github.com/wanadev/pontoon-debian/issues>`_,
* or on our `Discord server <https://discord.gg/BmUkEdMuFp>`_.

If you have a question about Pontoon itself (how to use it, etc.), you can:

* join the ``#pontoon`` channel on `chat.mozilla.org <https://chat.mozilla.org/>`_,
* post a message on the `Pontoon category of the Mozilla's forums <https://discourse.mozilla.org/c/pontoon/258>`_.

More information here: https://mozilla-pontoon.readthedocs.io/en/latest/dev/first-contribution.html#communicate-with-us


Bugs
----

If you found a bug in a script provided by the Pontoon Debian project, please `open an issue on Github <https://github.com/wanadev/pontoon-debian/issues>`_.

If you found a bug in Pontoon itself, please `open an issue on the Mozilla bug tracker <https://bugzilla.mozilla.org/enter_bug.cgi?product=Webtools&component=Pontoon>`_.


Pull Requests
-------------

If you want to improve this manual or the distributed scripts, feel free to `open a pull request on Github <https://github.com/wanadev/pontoon-debian/pulls>`_.


Building the Documentation
--------------------------

This manual is written using `Sphinx <https://www.sphinx-doc.org/en/master/>`_. To build it, you will need Python and to install some dependencies.

To install all dependencies, you can use the ``requirements.txt`` file::

    pip install -r requirements.txt

Then you will be able to build the doc with the following command::

    make html

The result goes to the ``build/html/`` folder.
