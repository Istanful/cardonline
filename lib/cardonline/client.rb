class Cardonline::Client
  include Safettp::Client

  def self.configure_from_master(master_config)
    configure do |config|
      config.base_url = master_config.base_url
      config.default_options = {
        auth: {
          type: :basic,
          username: master_config.username,
          password: master_config.password
        }
      }
    end
  end

  def add_card(template_id, body, &block)
    post('/cards', body: body, query: { template_id: template_id }, &block)
  end

  def get_card(card_id, &block)
    get("/cards/#{card_id}", &block)
  end

  def update_card(card_id, attributes, &block)
    put("/cards/#{card_id}", body: attributes, &block)
  end

  def get_order(order_id, &block)
    get("/orders/#{order_id}", &block)
  end

  def get_orders(&block)
    get("/orders", &block)
  end
end
