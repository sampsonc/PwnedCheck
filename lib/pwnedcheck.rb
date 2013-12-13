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
  # @param address [String] the email address to check
  # @return [Array] an array of sites that the email address is associated with
  def self.check(address)
    agent = Mechanize.new
    agent.user_agent = 'PwnedCheck (http://www.chs.us/PwnedCheck)'
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
        raise ex
      end
    else
      JSON.parse(page.content)
    end
  end
end
