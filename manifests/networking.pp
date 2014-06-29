class role::networking ($device_name, $mgmt_ip_addr, $instance_ip_addr) {
  $mac_addr = getvar("macaddress_${device_name}")
  file { "/etc/sysconfig/network-scripts/ifcfg-${device_name}":
    content => templace('role/ifcfg.erb')
  }
}
