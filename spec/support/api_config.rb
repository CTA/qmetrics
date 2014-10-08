require 'yaml'

class APIConfig
  attr_reader :server, :port, :user, :pass

  def initialize
    @api_config = YAML.load_file(File.join(File.dirname(__FILE__),
                                          "api_config.yml"))
    @server = @api_config[:server]
    @port   = @api_config[:port]
    @user   = @api_config[:user]
    @pass   = @api_config[:pass]
  end

  def to_h
    @api_config 
  end

end
