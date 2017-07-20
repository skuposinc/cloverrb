module Cloverrb
  class LineItem < Client
    def initialize(token, order, merchant)
      @token = token
      @order = order
      @merchant = merchant
    end

    def all
      url = "/merchants/#{@merchant}/orders/#{@order}/line_items"
      get(@token, url)
    end
  end
end