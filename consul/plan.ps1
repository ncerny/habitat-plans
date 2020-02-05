$pkg_origin="ncerny"
$pkg_name="consul"
$pkg_version="1.6.1"
$pkg_maintainer='Nathan Cerny <ncerny@gmail.com>'
$pkg_license=("MPL-2.0")
$pkg_description="Consul is a tool for service discovery, monitoring and configuration."
$pkg_upstream_url="https://www.consul.io/"
$pkg_source="https://releases.hashicorp.com/${pkg_name}/${pkg_version}/${pkg_name}_${pkg_version}_windows_amd64.zip"
$pkg_shasum="aff314cf60da7cdb636cb8e1bc1754d66f5bf013c52a1e3636394208ee6f9e46"
$pkg_filename="${pkg_name}-${pkg_version}_windows_amd64.zip"
$pkg_deps=@()
$pkg_build_deps=@("core/7zip")
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
  cd "${HAB_CACHE_SRC_PATH}"
  7z e "${pkg_filename}" -o"${pkg_name}-${pkg_version}"
}

function Invoke-Build {
  return 0
}

function Invoke-Install {
  Copy-Item "consul.exe" "${pkg_prefix}\bin" -Force
}

function Invoke-BuildService {
  Remove-Item "${pkg_prefix}\hooks" -Recurse
  New-Item "${pkg_prefix}\hooks" -ItemType Directory
  Get-Item $PLAN_CONTEXT\hooks\*.ps1 | ForEach-Object {
    Copy-Item $_ ${pkg_prefix}/hooks/$($_.Basename)
  }
}