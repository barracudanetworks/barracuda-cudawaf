Puppet::Type.newtype(:security_policy_url_normalization) do
  @doc = 'Defines all possible types for Url Normalization of Security Policy object on the Barracuda Web Application Firewall.'

  ensurable

  newparam(:name, :namevar => true) do
    desc "Policy Name"
    validate do |value|
      fail("Invalid name #{value}, Illegal characters present") unless value =~ /^[a-zA-Z][a-zA-Z0-9\._\-]*$/
      fail("Invalid name #{value}, Must be no longer than 64 characters") if value.length > 64
    end
  end


  newproperty(:apply_double_decoding) do
    desc "Apply Double Decoding"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:default_charset) do
    desc "Default Character Set"
    defaultto "UTF-8"
    newvalues("ASCII", "ISO-8859-1", "UTF-8", "GBK", "GB2312", "ISO-2022-CN", "HZ", "BIG5", "EUC-TW", "Shift-JIS", "EUC-JP", "ISO-2022-JP", "EUC-KR", "JOHAB", "ISO-2022-KR")
  end


  newproperty(:detect_response_charset) do
    desc "Detect Response Charset"
    defaultto :No
    newvalues(:Yes, :No)
  end


  newproperty(:parameter_separators) do
    desc "Parameter Separators"
    defaultto 'Ampersand only'
    newvalues('Ampersand and Semicolon', 'Ampersand only', 'Semicolon only')
  end


end
