module Cloverrb
  class Order < Client
    def initialize(token)
      @token = token
    end

    def all(merchant_id, start_datetime=nil, end_datetime=nil)
      url = "/merchants/#{merchant_id}/orders"

      if start_datetime && end_datetime
        url += "?filter=createdTime>=#{start_datetime}"
        url += "&filter=createdTime<=#{end_datetime}"
      end

      response = get(@token, url)
    end
  end
end