module QM
  class HTTPStatusError < StandardError
  end

  class API

    def initialize(server: , port: , user: , pass: )
      @base_route = "http://#{server}:#{port}/queuemetrics"
      @auth = { basic_auth: { username: user, password: pass } }
    end

    def call(api_method,options={})
      check_status(HTTParty.get("#{@base_route}/#{api_method}", 
                                options.merge(@auth)))
    end

    def stats
    end

    private

    def check_status(r)
      r.response.code == "200" ? r : raise(HTTPStatusError, r.response.code)
    end

  end

end
