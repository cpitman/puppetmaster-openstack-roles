class role::compute {

  class { 'nova':
    mysql_module       => '2.2',
    rpc_backend        => 'nova.openstack.common.rpc.impl_qpid',
    qpid_hostname      => '192.168.1.5',
    glance_api_servers => '192.168.1.5:9292'
  }

  class { 'nova::compute':
    enabled                       => true,
    vncserver_proxyclient_address => $ipaddress,
    vncproxy_host                 => '192.168.1.5'
  }

  class { 'nova::compute::libvirt':
    vncserver_listen => '0.0.0.0'
  }

} 
