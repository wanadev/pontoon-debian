Automatic Synchronization (cron)
--------------------------------

To enable automatic synchronization, we will use cron.

To configure this, first, login as ``pontoon``::

    su pontoon

then edit the cron configuration using the following command::

    crontab -e

You just have to call the `debian/sync-projects.sh
<https://github.com/wanadev/pontoon-debian/blob/master/debian/sync-projects.sh>`_
script at the desired interval. For example, you can add the following line to
run the synchronization every hour::

    0 * * * * /opt/pontoon/current/debian/sync-projects.sh

For more information, read `the crontab documentation
<https://www.man7.org/linux/man-pages/man5/crontab.5.html>`_.

You can also fetch other tasks mentioned on the `Pontoon documentation
<https://github.com/mozilla/pontoon/blob/main/docs/admin/deployment.rst#scheduled-jobs>`_.
For example, to have insights be fetched at the start of each day::

    0 6 * * * /opt/pontoon/current/debian/collect-insights.sh

Once done, you can leave from the ``pontoon`` shell using the ``exit`` command.

.. NOTE::

   If you installed Pontoon in at a custom location or if your *virtualenv* is
   not named ``__env__``, you will have to modify the `debian/sync-project.sh
   <https://github.com/wanadev/pontoon-debian/blob/master/debian/sync-projects.sh>`_
   script.
