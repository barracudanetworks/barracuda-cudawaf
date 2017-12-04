Puppet::Type.newtype(:system_ftp_access_logs) do
  @doc = 'Defines all possible types for Ftp Access Logs of System object on the Barracuda Web Application Firewall.'

  ensurable

  newproperty(:destination_directory_path) do
    desc "Destination Directory Path"
  end


  newproperty(:frequency) do
    desc "frequency"
    defaultto :daily
    newvalues('Never', 'Every Hour', 'Every Two Hours', 'Every Four Hours', 'Every Six Hours', 'Every Eight Hours', 'Every Twelve Hours', 'Daily')
  end


  newproperty(:logs_format) do
    desc "Logs Custom Format"
    defaultto '%h %id %u %t %r %s %br'
  end


  newproperty(:password) do
    desc ""
    defaultto :admin
  end


  newproperty(:port) do
    desc "FTP Server Port"
    defaultto :21
    validate do |value|
      fail("Invalid port #{value}, Must not be greater than 65536") if value > 65536
      fail("Invalid port #{value}, Must be no longer than 5 characters") if value.length > 5
    end
  end


  newproperty(:server_ip) do
    desc "FTP Server IP"
  end


  newproperty(:start_time) do
    desc "FTP Start Time"
    defaultto :00
  end


  newproperty(:username) do
    desc "Server Username"
    validate do |value|
      fail("Invalid username #{value}, Illegal characters present") unless value =~ /^[[:alpha:]][[:alnum:]\._-]*$/
    end
  end


end
