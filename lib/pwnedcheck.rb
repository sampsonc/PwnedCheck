# @author Carl Sampson <chs@chs.us>
require 'mechanize'
require 'addressable/uri'
require 'json'

# PwnedCheck module
module PwnedCheck
  # Thrown if the email address being checked does not have a valid format
  class BadRequest < Exception
    def initialize
      super
    end
  end

  # Check an address against http://haveibeenpwned.com
  #
  # == Parameters:
  # address::
  #   An email address to check
  #
  # == Returns::
  #   An array of sites the email address was found on or a BadRequest exception
  #
  def self.check(address)
    agent = Mechanize.new
    begin
      url =  "http://haveibeenpwned.com/api/breachedaccount/#{address}"
      page = agent.get Addressable::URI.parse(url)
    rescue Mechanize::ResponseCodeError  => ex
      case ex.response_code
      when '404'
        []
      when '400'
        raise BadRequest
      else
        raise e
      end
    else
      JSON.parse(page.content)
    end
  end
end
