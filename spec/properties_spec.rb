require 'spec_helper'

RSpec.describe Cloverrb::Properties do
  let(:token) { ENV['TEST_API_TOKEN'] }
  let(:merchant_id) { ENV['TEST_MERCHANT_ID'] }
  let(:client) { described_class.new(token, merchant_id) }

  describe 'GET merchant properties' do
    it 'returns the property details of the merchant' do
      VCR.use_cassette('get_property_details', record: :once) do
        response = client.fetch

        expect(response).to have_key('timezone')
        expect(response).to have_key('locale')
      end
    end
  end
end
