##init.pp##
class barracudawaf {
wafcloudcontrol{ 'WAFCouldControl-1':
  ensure => present,
  connect_mode => 'cloud',
  state => 'connected',
  username => 'aravindan.acct@selahcloud.in',
  password => 'bcc4me123!'
}

}
