#!/bin/bash

set -e

export DOTENV_PATH=/etc/opt/pontoon.env
export LANG=c

cd /opt/pontoon/current
source __env__/bin/activate

python manage.py clear_old_sync_logs

deactivate
