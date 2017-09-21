#!/bin/bash

JNB_CONF=$APP_PROJECT_ROOT/var/etc/jupyter_notebook_config.py

. $APP_PROJECT_VENV/bin/activate \
&& cd $APP_PROJECT_ROOT/notebook \
&& jupyter notebook --config $JNB_CONF
