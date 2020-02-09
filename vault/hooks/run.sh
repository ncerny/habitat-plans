#!/bin/sh
exec 2>&1

exec vault server -config="{{pkg.svc_config_path}}"
