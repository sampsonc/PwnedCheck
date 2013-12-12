require 'mechanize'
require 'addressable/uri'
require 'json'

module PwnedCheck
  class NotFound < Exception
    def initialize
      super
    end
  end

  class BadRequest < Exception
    def initialize
      super
    end
  end

  def self.check(address)
    agent = Mechanize.new
    begin
      url =  "http://haveibeenpwned.com/api/breachedaccount/#{address}"
      page = agent.get Addressable::URI.parse(url)
    rescue Mechanize::ResponseCodeError  => e
      raise NotFound if e.response_code == '404'
      raise BadRequest if e.response_code == '400'
    else
      JSON.parse(page.content)
    end
  end
end
