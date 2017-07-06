module Cloverrb
  class Client
    BASE_URL = "https://api.clover.com/v3/"

    def get(token, path)
      HTTParty.get(
        BASE_URL + path,
        headers: build_headers(token)
      ).parsed_response
    end

    def post(token, path, body)
      HTTParty.post(
        BASE_URL + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    def put(token, path, body)
      HTTParty.put(
        BASE_URL + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    private

    def build_headers(token)
      { "Authorization" => "Bearer #{token}"}
    end  
  end
end