Scheduled Tasks (cron)
======================

Tu automatically run scheduled tasks we will use cron.

To configure them, first, login as ``pontoon``::

    su pontoon

then edit the cron configuration using the following command::

    crontab -e

Once done, you can leave from the ``pontoon`` shell using the ``exit`` command.


Automatic Synchronization
-------------------------

To enable automatic synchronization you just have to call the `debian/sync-projects.sh
<https://github.com/wanadev/pontoon-debian/blob/master/debian/sync-projects.sh>`__
script at the desired interval.

For example, you can add the following line to run the synchronization every
hour::

    0 * * * * /opt/pontoon/current/debian/sync-projects.sh

For more information, read `the crontab documentation
<https://www.man7.org/linux/man-pages/man5/crontab.5.html>`__.

.. NOTE::

   If you installed Pontoon in at a custom location or if your *virtualenv* is
   not named ``__env__``, you will have to modify the `debian/sync-project.sh
   <https://github.com/wanadev/pontoon-debian/blob/master/debian/sync-projects.sh>`_
   script.


Other scheduled tasks
---------------------

You can also fetch other tasks mentioned on the `Pontoon documentation
<https://mozilla-pontoon.readthedocs.io/en/latest/admin/deployment.html#scheduled-jobs>`__.
A script is provided for each tasks:

* ``debian/clear-old-sync-logs.sh``
* ``debian/clear-sessions.sh``
* ``debian/collect-insights.sh``
* ``debian/send-deadline-notifications.sh``
* ``debian/send-review-notifications.sh``
* ``debian/send-suggestion-notifications.sh``
* ``debian/warmup-cache.sh``

For example, to have insights be fetched at the start of each day::

    0 6 * * * /opt/pontoon/current/debian/collect-insights.sh

.. NOTE::

   If you installed Pontoon in at a custom location or if your *virtualenv* is
   not named ``__env__``, you will have to modify the scripts!
