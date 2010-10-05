module Freebase
  class Base
    include HTTParty
    base_uri 'api.freebase.com'
    format :json

    def self.run query
      service_url = 'http://api.freebase.com/api/service/mqlread'
      query_envelope = { :query => query }
      url = service_url + '?query=' + CGI::escape(Yajl::Encoder.new.encode(query_envelope))
      response = get(url)
      Freebase::Response.new(Yajl::Parser.new.parse(response.body))
    end
  end
end
