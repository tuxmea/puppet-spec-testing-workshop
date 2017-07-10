class testing-workshop (
  $validate => false,
){
  package { 'less'
    ensure => present,
  }
  file { '/etc/lessrc':
    ensure => present,
    owner  => 'root'
    source => 'puppet:///modules/testing-workshop/lessrc.${::osfamily}',
  }
  if $::validate {
    notify { 'validation enabled': }
  }
}
