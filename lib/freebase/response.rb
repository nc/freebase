module Freebase
  class Response
    include Enumerable
    attr_reader :results

    def initialize(response_body)
      info = response_body["messages"].first["info"]
      @results = info["result"].map { |result| Freebase::Result.new(result) }
      @size = info["count"]
    end

    def each(&block)
      @results.each(&block)
    end
  end           
end