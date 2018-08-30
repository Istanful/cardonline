require "spec_helper"

RSpec.describe Cardonline do
  it "has a version number" do
    expect(Cardonline::VERSION).not_to be nil
  end

  describe 'configuration' do
    it 'defaults the base url' do
      Cardonline.configure {}

      expect(Cardonline.config.base_url).to eq('https://cardonline.se/api')
    end
  end
end
