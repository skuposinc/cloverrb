module Cloverrb
  class Properties < Client
    def initialize(token, merchant_code)
      @token = token
      @merchant_code = merchant_code
    end

    def fetch
      url = "/merchants/#{@merchant_code}/properties"
      get(@token, url)
    end
  end
end