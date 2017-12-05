##init.pp##
class barracudawaf {
  security_policy  {  'securitypolicy1':
    ensure        => present,
    name          => 'mytestpolicy'
  }
}
