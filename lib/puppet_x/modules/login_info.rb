#!/usr/bin/ruby

require 'net/http'
require 'uri'
require 'json'
require 'base64'
require 'logger'

class Login
  #
  #  Read the customer's input file for WAF info and credentials.
  #
  def read_credentials(url)
    #
    #  Read the device config file for a particular device URL.
    #  The file is present under /etc/puppetlabs/puppet/ by default.
    #
    #  Example contents of the file :
    #    [wafprod1]
    #      type cudawaf
    #      url https://<USERNAME>:<PASSWORD>@<IP ADDRESS OF WAF:PORT>/
    #
    filter_url = 'url ' + url

    File.foreach('/etc/puppetlabs/puppet/device.conf').each_slice(3) do |each_device|
      #
      # each_device is an array containing 3 lines. Read the info for the respective device specified.
      #
      match_url = each_device[2].strip
      if match_url == filter_url
        if match_url =~ /^url https?:\/\/(.*):(.*)\@(.*):(.*)\//
          $user = Regexp.last_match(1)
          $pwd = Regexp.last_match(2)
          $host = Regexp.last_match(3)
          $mgmt_port = Regexp.last_match(4)
          break
        else
          print "FATAL: Invalid format specified in device.conf!\n"
          return nil
        end
      end
    end
  end

  #
  #  Need to check if the user has accepted the EULA agreement.
  #
  def accept_eula(waf_ip, waf_port)
    accept_params = 'name_sign=self-provisioned&email_sign=self-provisioned&company_sign=self-provisioned&eula_hash_val=ed4480205f84cde3e6bdce0c987348d1d90de9db&action=save_signed_eula'
    eula_uri = URI.parse("http://#{waf_ip}:#{waf_port}/cgi-mod/index.cgi")
    eula_http = Net::HTTP.new(eula_uri.host, eula_uri.port)
    eula_request = Net::HTTP::Get.new(eula_uri.path)
    eula_response = eula_http.request(eula_request)
    eula_output = eula_response.body

    Puppet.debug(self.class.to_s.split("::").first + ": EULA response - #{eula_response}")
    if eula_response.to_s.match('Net::HTTPOK')
      eula_accept = 'yes'
    else
      if eula_output.match('You Must Accept the Barracuda Product Terms Below to Configure Your Barracuda Virtual Appliance')
        eula_accept = `curl http://#{waf_ip}:#{waf_port}/ -X POST -H Content-Type:application/x-www.form-urlencoded -d "#{accept_params}"`
      else
        sleep(20)
        puts 'Sorry, you must accept the Barracuda Product Terms to proceed.'
        eula_accept = 'no'
      end
    end

    Puppet.debug(self.class.to_s.split("::").first + ": EULA accept status - " + eula_accept)
  end

  #
  #  Login to get a valid token for authenticating API requests.
  #
  def login_mech(url)
    read_credentials(url)

    username = $user
    password = $pwd
    waf_ip = $host
    waf_port = $mgmt_port

    $common = "#{waf_ip}:#{waf_port}/restapi/v3/"
    $header = '-X POST -H Content-Type:application/json -d'
    common_path = $common

    eula_accepted = accept_eula waf_ip.to_s, waf_port.to_s
    exit if eula_accepted == 'no'

    #
    #  Logging in to the WAF
    #
    uri = URI.parse("http://#{common_path}login")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.body = { 'username' => username.to_s, 'password' => password.to_s }.to_json
    response = http.request(request)
    output = response.body
    parsed_json = JSON.parse(output)

    token_value = parsed_json['token']
  end

  #
  #  Form the Authorization header in the HTTP request to be sent to the WAF.
  #
  def get_auth_header(url)
    login_token = login_mech(url)

    login_token = login_token.to_s + ':'
    login_token.tr!('"', '')

    encoded_login_token = Base64.strict_encode64(login_token)
    encoded_token = encoded_login_token.to_s

    auth_header = 'Basic ' + encoded_token.to_s
  end
end
