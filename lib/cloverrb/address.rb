module Cloverrb
  class Address < Client
    def initialize(token, merchant_code)
      @token = token
      @merchant_code = merchant_code
    end

    def fetch
      url = "/merchants/#{@merchant_code}/address"
      get(@token, url)
    end
  end
end