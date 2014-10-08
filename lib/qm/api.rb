module QM
  class API
    
    def initialize(server: , port: , user: , pass: )
      @base_route = "http://#{server}:#{port}/queuemetrics"
      @auth = { basic_auth: { username: user, password: pass } }
    end

    def call(api_method,options={})
      HTTParty.get("#{@base_route}/#{api_method}", options.merge(@auth))
    end

  end
end
