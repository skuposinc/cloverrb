module Cloverrb
  class LineItem < Client
    def initialize(token, order, merchant, sandbox=false)
      @token = token
      @order = order
      @merchant = merchant
      @base_url = "https://apisandbox.dev.clover.com/v3" if sandbox
    end

    def all
      url = "/merchants/#{@merchant}/orders/#{@order}/line_items"
      get(@token, url)
    end
  end
end