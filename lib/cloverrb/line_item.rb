module Cloverrb
  class LineItem < Client
    def self.all(merchant_id, token, order_id)
      url = "/merchants/#{merchant_id}/orders/#{order_id}/line_items"
      get(token, url)
    end
  end
end