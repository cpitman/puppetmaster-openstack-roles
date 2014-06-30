class role::controller {
  class { 'mysql::server':
    root_password => "password",
  }
  class { 'keystone::db::mysql':
    password => 'password',
    mysql_module => '2.2'
  }
  class { 'keystone':
    admin_token => 'keystone',    
    database_connection => 'mysql://keystone:password@127.0.0.1/keystone',
    mysql_module => '2.2',
    public_endpoint => 'http://192.168.1.5:5000/v2.0/',
    admin_endpoint => 'http://192.168.1.5:35357/v2.0/'
  }
  class { 'keystone::cron::token_flush': }
  class { 'keystone::roles::admin': 
    email => 'cpitman1@gmail.com',
    password => 'password'
  }
  class { 'keystone::endpoint':
    public_url => 'http://192.168.1.5:5000',
    admin_url => 'http://192.168.1.5:35357'
  }
  class { 'qpid::server': }
}
    
