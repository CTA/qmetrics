module QM
  class HTTPStatusError < StandardError
  end

  class API
    attr_reader :stats

    def initialize(server: , port: , user: , pass: )
      @base_route = "http://#{server}:#{port}/queuemetrics"
      @auth = { basic_auth: { username: user, password: pass } }
    end

    def call(api_method,options={})
      check_status(HTTParty.get("#{@base_route}/#{api_method}", 
                                options.merge(@auth)))
    end

    def stats(q,from,to)
      @stats ||= QM::Stats.new(queues:q,from:from,to:to,api:self)
    end

    private

    def check_status(r)
      if r.response.code == "200"
        r.parsed_response
      else
        raise(HTTPStatusError, r.response.code)
      end
    end

  end

end
