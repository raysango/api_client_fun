require 'httparty'
module ApiClientFun
  module Resource
    API_URL = 'https://blooming-savannah-20593.herokuapp.com/api'
    class << self
      def get_json_request(path, params={})
        source = "#{API_URL}/#{path}"
        begin
          response = HTTParty.get(source, query: params)
          JSON.parse(response.body)
        rescue => e
          {error: e}
        end
      end
    end
  end
end