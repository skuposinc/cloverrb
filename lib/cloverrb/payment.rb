module Cloverrb
  class Payment < Client
    def initialize(token)
      @token = token
    end

    def all(merchant_id)
      url = "/merchants/#{merchant_id}/payments"
      get(@token, url)
    end

    def find(merchant_id, payment_id)
      url = "/merchants/#{merchant_id}/payments/#{payment_id}"

      get(@token, url)
    end
  end
end