require "cardonline/version"
require "forwardable"
require "safettp"
require "cardonline/client"

module Cardonline
  class << self
    extend Forwardable

    attr_accessor :config

    def_delegators :client, :add_card, :get_card, :update_card,
      :get_orders, :get_order

    def client
      Cardonline::Client
    end
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

