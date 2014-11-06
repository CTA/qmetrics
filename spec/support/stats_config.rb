class StatsConfig
  attr_reader :queues, :from, :to

  def initialize
    @stats_config = YAML.load_file(File.join(File.dirname(__FILE__),
                                             "stats_config.yml"))
    @api_config = APIConfig.new
    @queues = @stats_config[:queues]
    @from = Time.parse(@stats_config[:from])
    @to = Time.parse(@stats_config[:to])
    @api = Qmetrics::API.new(@api_config.to_h) 
  end

  def to_h
    @stats_config[:from] = @from
    @stats_config[:to] = @to
    @stats_config[:api] = @api
    @stats_config
  end

end

