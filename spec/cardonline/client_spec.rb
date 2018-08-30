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

  def covering_block
    ->(result) {
      result.on_success {}
      result.on_failure {}
    }
  end
end