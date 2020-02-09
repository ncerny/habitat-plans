pkg_origin=ncerny
pkg_name=vault
pkg_version=1.3.2
pkg_maintainer='Nathan Cerny <ncerny@gmail.com>'
pkg_license=("MPL-2.0")
pkg_description="Vault Secret Management"
pkg_upstream_url=https://www.vaultproject.io/
pkg_source="https://releases.hashicorp.com/${pkg_name}/${pkg_version}/${pkg_name}_${pkg_version}_linux_amd64.zip"
pkg_shasum="6e72132de0421b74d909f50be1823fe57182694c4268ba9a38c31213d9497ec9"
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
  install -D ${pkg_name} "${pkg_prefix}/bin/${pkg_name}"
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
