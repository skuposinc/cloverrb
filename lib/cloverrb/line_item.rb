module Cloverrb
  class LineItem < Client
    def initialize(token, order, merchant)
      @token = token
      @order = order
      @merchant = merchant
    end

    def all
      url = "/merchants/#{@merchant}/orders/#{@order}/line_items"
      response = get(@token, url)
    end

    def total(line_items)
    end
  end
end