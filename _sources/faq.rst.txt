Frequently Asked Questions
==========================

Where can I find the Pontoon's logs?
------------------------------------

You can find the Pontoon's logs in the system logs. By defaut they are in the ``/var/log/syslog`` file.

Pontoon logs are logged as ``gunicorn`` in the logs so you can display them in real time with the following command::

    tail -f /var/log/syslog | grep gunicorn


How to access the Django Admin?
-------------------------------

You can access the Django Admin on the ``/a/`` route of your Pontoon installation. Example::

    https://pontoon.example.com/a/

If you are not able to access this page, it means you have insufficient permission. See bellow to promote your user as superuser.


.. _django_auth_superuser:

Django Authentication Method
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are using Django authentication method (``AUTHENTICATION_METHOD=django`` in ``/etc/opt/pontoon.env``):

* Logout from your current session
* Got to the login page (https://pontoon.example.com/accounts/standalone-login/)
* Login using your administrator user (to create one, see :ref:`create_django_admin_user`)
* Go to the Django Admin page (https://pontoon.example.com/a/)
* Go to "Authentication and Authorization" → "Users"
* Click on the email address of the user you want to promote
* In the "Permissions" section, check both "Staff status" and "Superuser status"
* Click on the "Save" button at the bottom of the page
* Logout from the admin account
* Log back with your regular user, it should now have access to the Django Admin page.


Other Authentication Methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you are not user Django standalone authentication method:

* Edit the ``/etc/opt/pontoon.env`` file
* Set ``AUTHENTICATION_METHOD`` to ``django``
* Save the file
* Restart the Pontoon service: ``systemctl restart pontoon``
* Follow the instruction of the :ref:`django_auth_superuser` section above
* Then edit again the ``/etc/opt/pontoon.env`` file
* Set back the ``AUTHENTICATION_METHOD`` to your previous method (``gitlab``, ``github``,...)
* Restart the Pontoon service: ``systemctl restart pontoon``
* You should now have access to the Django Admin page with your user.
