require "spec_helper"

RSpec.describe Cloverrb::Client do
  it "has proper base url" do
    expect(described_class::BASE_URL).to eq "https://api.clover.com/v3"
  end
end