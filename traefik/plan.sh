pkg_name=traefik
pkg_origin=ncerny
pkg_version=$(cat ./VERSION)
pkg_maintainer="Nathan Cerny <ncerny@gmail.com>"
pkg_license=("Apache-2.0")
pkg_source="https://github.com/containous/traefik/releases/download/v${pkg_version}/traefik_v${pkg_version}_linux_amd64.tar.gz"
pkg_shasum="0c3c81a53fcd63944da852e965118059c042ae3981fdf5df4b58449b57559b68"
pkg_svc_run="traefik --providers.file.directory $pkg_svc_config_path --providers.file.watch true"
pkg_svc_user="root"
pkg_description="Traefik Cloud Native Edge Router"
pkg_upstream_url="https://containo.us/traefik/"

do_build() {
  return 0
}

do_install() {
  install $HAB_CACHE_SRC_PATH/traefik $pkg_prefix
}
