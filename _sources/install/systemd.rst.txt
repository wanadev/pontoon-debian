Startup Configuration (systemd)
===============================

To run Pontoon at startup, you will have to install a *systemd* service unit
file and to enable it.

We provide a `ready to use service unit
<https://github.com/wanadev/pontoon-debian/blob/master/debian/pontoon.service>`_
in the ``debian/`` folder, so you just have to copy it::

    cp /opt/pontoon/current/debian/pontoon.service /etc/systemd/system/

.. NOTE::

   If you installed Pontoon in at a custom location or if your *virtualenv* is
   not named ``__env__``, you will have to modify this unit.

You can now enable this unit to allow it to be run at startup::

    systemctl enable pontoon

And you can start Pontoon now by running the following command::

    systemctl start pontoon

Finally, you can check it works using the following command::

    systemctl status pontoon

If everything is OK, it should display something similar to this::

    ● pontoon.service - Pontoon
       Loaded: loaded (/etc/systemd/system/pontoon.service; enabled; vendor preset: enabled)
       Active: active (running) since Mon 2021-03-22 17:46:43 CET; 48s ago
     Main PID: 2362 (gunicorn)
        Tasks: 2 (limit: 1150)
       Memory: 63.7M
