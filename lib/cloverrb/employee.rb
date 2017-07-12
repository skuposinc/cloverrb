module Cloverrb
  class Employee < Client
    def initialize(token, merchant_code)
      @token = token
      @merchant_code = merchant_code
    end

    def all(role=nil)
      url = "/merchants/#{@merchant_code}/employees"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end
  end
end