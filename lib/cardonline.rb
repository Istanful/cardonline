require "cardonline/version"
require "safettp"

module Cardonline
  class << self
    attr_writer :config

    def config
      @config || Configuration.new
    end
  end

  class Configuration
    attr_accessor :username, :password, :base_url

    def initialize
      @base_url = 'https://cardonline.se/api'
    end
  end

  def self.configure
    yield(config)
  end
end

require "cardonline/client"

