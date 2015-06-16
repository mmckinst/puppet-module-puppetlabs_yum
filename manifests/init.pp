# Class puppetlabs
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RH${ostype},
#     Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include puppetlabs
#
class puppetlabs_yum (
  $collection_number         = $puppetlabs_yum::params::collection_number,
  $products_baseurl          = $puppetlabs_yum::params::products_baseurl,
  $deps_baseurl              = $puppetlabs_yum::params::deps_baseurl,
  $devel_baseurl             = $puppetlabs_yum::params::devel_baseurl,
  $collection_baseurl        = $puppetlabs_yum::params::collection_baseurl,
  $products_source_baseurl   = $puppetlabs_yum::params::products_source_baseurl,
  $deps_source_baseurl       = $puppetlabs_yum::params::deps_source_baseurl,
  $devel_source_baseurl      = $puppetlabs_yum::params::devel_source_baseurl,
  $collection_source_baseurl = $puppetlabs_yum::params::collection_source_baseurl,
  $products_descr            = $puppetlabs_yum::params::products_descr,
  $deps_descr                = $puppetlabs_yum::params::deps_descr,
  $devel_descr               = $puppetlabs_yum::params::devel_descr,
  $collection_descr          = $puppetlabs_yum::params::collection_descr,
  $products_source_descr     = $puppetlabs_yum::params::products_source_descr,
  $deps_source_descr         = $puppetlabs_yum::params::deps_source_descr,
  $devel_source_descr        = $puppetlabs_yum::params::devel_source_descr,
  $collection_source_descr   = $puppetlabs_yum::params::collection_source_descr,
  $enable_products           = true,
  $enable_deps               = true,
  $enable_devel              = false,
  $enable_collection         = false,
) inherits puppetlabs_yum::params {

  if $::is_pe == 'false' or $::is_pe == false or $::is_pe == undef {

    if $::osfamily == 'RedHat' {
      include puppetlabs_yum::gpg_key
      include puppetlabs_yum::products
      include puppetlabs_yum::deps
      include puppetlabs_yum::devel
      include puppetlabs_yum::collection

      anchor { 'puppetlabs_yum::start': }->
      Class['puppetlabs_yum::gpg_key']->
      Class['puppetlabs_yum::products']->
      Class['puppetlabs_yum::deps']->
      Class['puppetlabs_yum::devel']->
      Class['puppetlabs_yum::collection']->
      anchor { 'puppetlabs_yum::end': }

    } else {
      notice ("Your operating system ${::operatingsystem} will not have Puppet Labs Yum repository configured")
    }
  } else {
    notice('Not installing puppetlabs_yum because you have Puppet Enterprise installed')
  }

}
