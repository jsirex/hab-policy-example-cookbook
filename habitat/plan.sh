scaffold_policy_name=hab-example

pkg_name=hab-policy-example
pkg_origin=jsirex
pkg_version="0.1.0"
pkg_maintainer="Yauhen Artsiukhou <jsirex@gmail.com>"
pkg_license=("Apache-2.0")
pkg_description="The Chef $scaffold_policy_name Policy"
pkg_upstream_url="http://chef.io"
pkg_scaffolding="jsirex/scaffolding-chef/0.1.3/20180913132214"

pkg_deps=(
    core/nginx
)
pkg_build_deps=(
    core/git
    core/make
    core/gcc
    core/gcc-libs
    core/curl
)

do_build_config() {
    do_default_build_config

    cat << EOF >> $pkg_prefix/config/client-config.rb

clear_gem_sources true
rubygems_url []
EOF
    cat <<EOF >> $pkg_prefix/config/bootstrap-config.rb

clear_gem_sources true
rubygems_url []
EOF
}

do_install() {
    do_default_install
    do_install_gems
}

do_install_gems() {
    # Required for the habitat cookbook
    gem install toml -i $pkg_prefix
    gem install mongo -i $pkg_prefix
}
