module Qmetrics
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

    def stats(**args)
      if args.empty?
        @stats
      else
        @stats = Qmetrics::Stats.new(args.merge({api: self}))
      end
    end

    def realtime(**args)
      if args.empty?
        @realtime
      else
        @realtime = Qmetrics::Realtime.new(args.merge({api: self}))
      end
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
