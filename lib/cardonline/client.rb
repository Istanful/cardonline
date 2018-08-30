class Cardonline::Client
  include Safettp::Client

  configure do |config|
    config.base_url = 'https://cardonline.se/test_api'
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
end
