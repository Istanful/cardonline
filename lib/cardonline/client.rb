class Cardonline::Client
  include Safettp::Client

  configure do |config|
    config.base_url = 'https://cardonline.se/test_api'
  end

  def add_card(template_id, body, &block)
    post('/cards', body: body, query: { template_id: template_id }, &block)
  end
end
