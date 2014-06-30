class role::controller {

  $keystone_auth_url = 'http://192.168.1.5:5000/v2.0/'
  $mysql_module = '2.2'
  
  class { 'mysql::server':
    root_password => "password",
  }

  class { 'keystone::db::mysql':
    password => 'password',
    mysql_module => $mysql_module
  }

  class { 'keystone':
    admin_token => 'keystone',    
    database_connection => 'mysql://keystone:password@127.0.0.1/keystone',
    mysql_module => $mysql_module,
    public_endpoint => $keystone_auth_url,
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

  class { 'glance::db::mysql': 
    password => 'password',
    mysql_module => $mysql_module
  }

  class { 'glance::api':
    keystone_password => 'password',
    auth_url => $keystone_auth_url,
    mysql_module => $mysql_module,
    database_connection => 'mysql://glance:password@127.0.0.1/glance'
  } 

  class { 'glance::keystone::auth':
    password => 'password',
    public_address => '192.168.1.5',
    admin_address => '192.168.1.5',
    internal_address => '192.168.1.5'
  }

  class { 'glance::registry':
    keystone_password => 'password',
    mysql_module => $mysql_module,
    database_connection => 'mysql://glance:password@127.0.0.1/glance'
    auth_host => '192.168.1.5'
  }

  class { 'glance::client': }

  class { 'glance::notify::qpid':
    qpid_password => 'password',
    qpid_hostname => 'controller'
  }

  class { 'glance::cache:cleaner': }

  class { 'glance::cache::pruner': }

  class { 'glance::backend::file': }
}
    
