require "cardonline/version"
require "safettp"
require "cardonline/client"

module Cardonline
  class << self
    attr_accessor :config
  end

  class Configuration
    attr_accessor :username, :password, :base_url

    def initialize
      @base_url = 'https://cardonline.se/api'
    end
  end

  def self.configure
    @config ||= Configuration.new
    yield(@config)
    Cardonline::Client.configure_from_master(@config)
  end
end


