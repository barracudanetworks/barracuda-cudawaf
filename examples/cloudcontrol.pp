##init.pp##
class barracudawaf {
  cloudcontrol  {  'WAFCouldControl-1':
	  ensure       => present,
	  connect_mode => 'cloud',
	  state        => 'connected',
	  username     => '<username>',
	  password     => '<password>'
	}
}
