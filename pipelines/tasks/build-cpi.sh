#!/usr/bin/env bash

set -e

source bosh-cpi-src/ci/utils.sh
source /etc/profile.d/chruby.sh
chruby ${RUBY_VERSION}

semver=`cat version-semver/number`


# TODO: if a customized CPI is specified, don't create-release, but just copy it to /candidate/....
pushd bosh-cpi-src > /dev/null
  cpi_release_name="bosh-azure-cpi"

  echo "building CPI release..."
  bosh create-release --name $cpi_release_name --version $semver --tarball ../candidate/$cpi_release_name-$semver.tgz
popd > /dev/null
