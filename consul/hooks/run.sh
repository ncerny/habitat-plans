#!/bin/sh
exec 2>&1

exec consul agent -config-dir="{{pkg.svc_config_path}}"
