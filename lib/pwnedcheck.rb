# coding: utf-8
=begin
Copyright (c) 2013 Carl Sampson <chs@chs.us>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end

require 'net/http'
require 'cgi'
require 'json'

# PwnedCheck module
module PwnedCheck
  # Thrown if the email address being checked does not have a valid format
  class InvalidEmail < Exception
    def initialize
      super 'Invalid email address format'
    end
  end
  
  class RequestThrottled < Exception
    attr_accessor :timeout
    def initialize (t)
      @timeout = t.to_i
    end
  end

  # Check an address against http://haveibeenpwned.com
  #
  # @param item [String] the item to check.  Could be an email address, phone number, or username
  # @return [Array] an array of sites that the email address is associated with
  def self.check(item)
    begin
      uri = URI.parse "https://haveibeenpwned.com/api/v2/breachedaccount/#{CGI::escape(item)}"
      response = Net::HTTP.get_response uri
      case response.code
      when '200'
        JSON.parse response.body
      when '404'
        []
      when '400'
        fail InvalidEmail
      when '429'
        raise RequestThrottled.new response.header['Retry-After']
      end
    rescue RequestThrottled => err
      sleep err.timeout
      retry
    end
  end

  # Check an address for pastes against http://haveibeenpwned.com
  #
  # @param item [String] the item to check.  Could be an email address, phone number, or username
  # @return [Array] an array of pastes that the email address is associated with
  def self.check_pastes(item)
    begin
      uri = URI.parse "https://haveibeenpwned.com/api/v2/pasteaccount/#{CGI::escape(item)}"
      response = Net::HTTP.get_response uri
      case response.code
      when '200'
        JSON.parse response.body
      when '404'
        []
      when '400'
        fail InvalidEmail
      when '429'
        raise RequestThrottled.new response.header['Retry-After']
      end
    rescue RequestThrottled => err
      sleep err.timeout
      retry
    end
  end
end
