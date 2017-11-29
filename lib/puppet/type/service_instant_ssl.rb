Puppet::Type.newtype(:service_instant_ssl) do
  @doc = 'Defines all possible types for a Service object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Web Application Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:secure_site_domain) do
    desc "Secure Site Domain"
  end


  newproperty(:status) do
    desc "Status"
    defaultto :Off
    newvalues(:On, :Off)
  end


  newproperty(:sharepoint_rewrite_support) do
    desc "SharePoint Rewrite Support"
    defaultto :Off
    newvalues(:On, :Off)
  end


end
