class role::controller {
  class { 'mysql::server':
    root_password => "password",
  }
  class { 'keystone::db::mysql':
    password => 'keystone_password',
    mysql_module => '2.2'
  }
  class { 'keystone':
    admin_token => 'keystone',    
    database_connection => 'mysql://keystone:keystone_password@192.168.1.5/keystone',
    mysql_module => '2.2',
    public_endpoint => 'http://192.168.1.5:5000/v2.0/',
    admin_endpoint => 'http://192.168.1.5:35357/v2.0/'
  }
  class { 'keystone::cron::token_flush': }
  class { 'qpid::server': }
}
    
