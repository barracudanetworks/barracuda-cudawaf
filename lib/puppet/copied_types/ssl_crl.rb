Puppet::Type.newtype(:ssl_crl) do
  @doc = 'Defines all possible types for SSL CRL object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "CRL Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 60 characters") if value.length > 60
    end
  end


  newproperty(:auto_update) do
    desc "CRL Auto Update"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:auto_update_type) do
    desc "Auto Update Type"
    defaultto :Monthly
    newvalues(:Daily, :Weekly, :Monthly)
  end


  newproperty(:date_of_month) do
    desc "Date Of Month"
    defaultto :15
    validate do |value|
      fail("Invalid date_of_month #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid date_of_month #{value}, Must not be greater than 31") if value > 31
    end
  end


  newproperty(:day_of_week) do
    desc "Day Of Week"
    defaultto :Sunday
    newvalues(:Sunday, :Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday)
  end


  newproperty(:enable) do
    desc "Enable CRL"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:number_of_retries) do
    desc "Number of Retries"
    defaultto 3
    newvalues(:1, :2, :3)
    munge do |value|
      Integer(value)
    end
    validate do |value|
      fail("Invalid number_of_retries #{value}, Must not be lesser than 1") if value < 1
      fail("Invalid number_of_retries #{value}, Must not be greater than 3") if value > 3
    end
  end


  newproperty(:time_of_day) do
    desc "Time Of Day"
    defaultto :14:14
    validate do |value|
      fail("Invalid time_of_day #{value}, Illegal characters present") unless value =~ /^([01]?\d|2[0-3]):([0-5]?\d)$/
      fail("Invalid time_of_day #{value}, Must be no longer than 5 characters") if value.length > 5
    end
  end


  newproperty(:url) do
    desc "CRL URL"
  end


end
