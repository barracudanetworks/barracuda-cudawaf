##init.pp##
class barracudawaf {
    security_policy  {  'secuirtypolicy1':
    ensure        => present,
    name          => 'mytestpolicy'
  }


}
