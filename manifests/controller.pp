class role::controller {
  class { 'mysql::server':
    root_password => "password",
    users => {
      'keystone@localhost' => {
        ensure => 'present',
        password_hash => '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'
      }
    },
    grants => {
      'keystone@localhost/keystone.*' => {
        ensure => 'present',
        options => ['GRANT'],
        privileges => ['ALL'],
        table => 'keystone.*',
        user => 'keystone@localhost'
      }
    },
    databases => {
      'keystone' => {
        ensure => 'present'
      }
    }
  }
}
    
