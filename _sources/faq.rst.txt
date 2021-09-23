Frequently Asked Questions
==========================

Where can I find the Pontoon's logs?
------------------------------------

You can find the Pontoon's logs in the system logs. By defaut they are in the ``/var/log/syslog`` file.

Pontoon logs are logged as ``gunicorn`` in the logs so you can display them in real time with the following command::

    tail -f /var/log/syslog | grep gunicorn
