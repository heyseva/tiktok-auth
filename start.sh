#!/bin/bash

# Start supervisord and services
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
