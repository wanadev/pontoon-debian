#!/bin/bash

set -e

export DOTENV_PATH=/etc/opt/pontoon.env
export LANG=c

cd /opt/pontoon/current
source __env__/bin/activate

python manage.py collect_insights

deactivate
