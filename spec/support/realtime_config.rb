class RealtimeConfig
  attr_reader :queues

  def initialize
    @realtime_config = YAML.load_file(File.join(File.dirname(__FILE__),
                                                "realtime_config.yml"))
    @api_config = APIConfig.new
    @queues = @realtime_config[:queues]
    @api = Qmetrics::API.new(@api_config.to_h)
  end

  def to_h
    @realtime_config[:api] = @api
    @realtime_config
  end

end

