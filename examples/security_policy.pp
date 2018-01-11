class barracudawaf {
      cudawaf_security_policy  {  'securitypolicy1':
        ensure            => present,
        name              => 'CustomPolicy',
      }
}
