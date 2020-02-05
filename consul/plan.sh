pkg_origin=ncerny
pkg_name=consul
pkg_version=1.6.3
pkg_maintainer='Nathan Cerny <ncerny@gmail.com>'
pkg_license=("MPL-2.0")
pkg_description="Consul is a tool for service discovery, monitoring and configuration."
pkg_upstream_url=https://www.consul.io/
pkg_source="https://releases.hashicorp.com/${pkg_name}/${pkg_version}/${pkg_name}_${pkg_version}_linux_amd64.zip"
pkg_shasum="3ada92a7b49c11076d0a2db9db4ad53ee366fcfb0e057118a322ad0daf188c60"
pkg_filename="${pkg_name}-${pkg_version}_linux_amd64.zip"
pkg_build_deps=(core/7zip)

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  7z e "${pkg_filename}" -o"${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D consul "${pkg_prefix}/bin/consul"
}

do_build_service() {
  rm -r "${pkg_prefix}/hooks"
  mkdir -p "${pkg_prefix}/hooks"
  cd $PLAN_CONTEXT
  for hook in $(ls hooks/*.sh); do
    cp ${hook} ${pkg_prefix}/${hook%.*}
    chmod 0750 ${pkg_prefix}/${hook%.*}
  done
}
