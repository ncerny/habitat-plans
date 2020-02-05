#!/bin/sh

exec 2>&1

SERVERMODE={{cfg.server.mode}}
export CONSUL_UI_LEGACY={{cfg.server.legacy_ui}}

CONSUL_OPTS="-dev"
if [ "$SERVERMODE" = true ]; then
  CONSUL_OPTS="{{~#if cfg.website}} -ui {{~/if}} -server -bootstrap-expect {{cfg.bootstrap.expect}} -config-file={{pkg.svc_config_path}}/basic_config.json"
fi

exec consul agent ${CONSUL_OPTS}