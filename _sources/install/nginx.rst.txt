Nginx
=====

Pontoon runs using a Python WSGI HTTP server named `Gunicorn
<https://gunicorn.org/>`_. This server is not designed to deal with slow
clients, so `it needs a proxy server
<https://docs.gunicorn.org/en/latest/deploy.html>`_ to buffer them. We will see
in this section how to install and configure Nginx as proxy server for Pontoon.


.. WARNING::

    Pontoon only works with HTTPS so you will need a TLS certificate (you can
    get one for free using `let's encrypt <https://letsencrypt.org/>`_).


Installing Nginx
----------------

To install Nginx, simply run the following command::

    apt install nginx


Configuring a Nginx Vhost For Pontoon
-------------------------------------

We provide a sample Nginx *vhost* in `debian/pontoon.nginx.conf <https://github.com/wanadev/pontoon-debian/blob/master/debian/pontoon.nginx.conf>`_, so we will start by copying it to the Nginx folder::

    cp /opt/pontoon/current/debian/pontoon.nginx.conf /etc/nginx/sites-available/

Now you should edit that file to configure at least the server name and the paths to the certificate:

.. code-block:: nginx

    server {
        listen 80;
        listen 443 ssl http2;
        server_name pontoon.example.org;

        ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem;
        ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;

        # [...]

    }

You can show the complete file `on Github
<https://github.com/wanadev/pontoon-debian/blob/master/debian/pontoon.nginx.conf>`_.

Once configured, you just have to enable the *vhost* by creating a symbolic
link::

    ln -s /etc/nginx/sites-available/pontoon.nginx.conf /etc/nginx/sites-enabled/pontoon.nginx.conf

And to reload the Nginx configuration::

    systemctl reload nginx

If everything is OK, you should now be able to access your Pontoon instance
using your favorite web browser.
