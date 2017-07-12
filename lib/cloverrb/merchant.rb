module Cloverrb
  class Merchant < Client
    def initialize(token)
      @token = token
    end 

    def find(merchant_id)
      url = "/merchants/#{merchant_id}"
      get(@token, url) 
    end
  end
end