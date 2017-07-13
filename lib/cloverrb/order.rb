module Cloverrb
  class Order < Client
    def initialize(token)
      @token = token
    end

    def all(merchant_id, start_datetime=nil, end_datetime=nil, state=nil)
      url = "/merchants/#{merchant_id}/orders"

      if state && start_datetime && end_datetime
        url += "?filter=createdTime>=#{start_datetime}"
        url += "&filter=createdTime<=#{end_datetime}"
        url += "&filter=state=#{state}"
      elsif start_datetime && end_datetime
        url += "?filter=createdTime>=#{start_datetime}"
        url += "&filter=createdTime<=#{end_datetime}"
      elsif state
        url += "?filter=state=#{state}"
      end

      get(@token, url)
    end

    def self.total(line_items)
      items = line_items["elements"]
      items.inject(0) { |sum, item| sum + item["price"] }
    end
  end
end