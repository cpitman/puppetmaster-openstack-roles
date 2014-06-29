class role::common
{
  user { 'cpitman':
    ensure   => present,
    password => '$6$3xEmbtIKz4R1ivAp$rOcUwwY5bm6G8YKwYaLrEM61mRZ2hQDFnZJVY.k6dISdOkix/KNLTLI/N4.SpAJ0/IOEZZr4sMtpWh67vC4jJ.',
    groups   => 'wheel',
    managehome => true
  }
  
  user { 'jculleton':
    ensure   => present,
    password => '$6$a/uVfwn8Cqzorv/Q$ytXRW88xoHHoQL23CSjWgHf1gKMcodwK5uEFyb607lWu8GYIbO181LvVl/QV1D7NWlkLPCKfrVSWPHANYVRHn0',
    groups   => 'wheel',
    managehome => true
  }
  
  service { 'iptables':
    ensure => stopped,
    enable => false
  }
  
  if $::operatingsystem == Fedora {
    service { 'firewalld':
      ensure => stopped,
      enable => false
    }
  }
  
  service { 'NetworkManager':
    ensure => stopped,
    enable => false
  }
  
  include '::ntp'
  
}