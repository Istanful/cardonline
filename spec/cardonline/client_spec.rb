require 'spec_helper'

RSpec.describe Cardonline::Client do
  let(:base_url) { Cardonline::Client.config.base_url }

  describe '#add_card' do
    it 'performs a POST request to the appropriate url' do
      template_id = 1
      card_params = { name: 'Oscar' }
      url = "#{base_url}/cards?template_id=#{template_id}"
      stubbed_request = stub_request(:post, url).with(body: card_params.to_json)
      client = described_class.new

      client.add_card(template_id, card_params, &covering_block)

      expect(stubbed_request).to have_been_made
    end
  end

  describe '#get_card' do
    it 'performs a GET request to the appropriate url' do
      card_id = 1
      url = "#{base_url}/cards/#{card_id}"
      stubbed_request = stub_request(:get, url)
      client = described_class.new

      client.get_card(card_id, &covering_block)

      expect(stubbed_request).to have_been_made
    end
  end

  describe '#update_card' do
    it 'performs a PUT request to the appropriate url' do
      card_id = 1
      url = "#{base_url}/cards/#{card_id}"
      body = { name: 'Bertil' }
      stubbed_request = stub_request(:put, url).with(body: body.to_json)
      client = described_class.new

      client.update_card(card_id, body, &covering_block)

      expect(stubbed_request).to have_been_made
    end
  end

  describe '#get_order' do
    it 'performs a GET request to the appropriate url' do
      order_id = 1
      url = "#{base_url}/orders/#{order_id}"
      body = { name: 'Bertil' }
      stubbed_request = stub_request(:get, url)
      client = described_class.new

      client.get_order(order_id, &covering_block)

      expect(stubbed_request).to have_been_made
    end
  end

  def covering_block
    ->(result) {
      result.on_success {}
      result.on_failure {}
    }
  end
end
