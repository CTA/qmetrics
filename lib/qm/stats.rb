require 'yaml'

module QM
  class Stats
    attr_reader :blocks

    METHODS = YAML.load_file(File.join(File.dirname(__FILE__),
                                        "stats_methods.yml"))    

    def initialize(queues: , from: , to: , api: )
      @queues = "?queues=#{queues.join("|")}" 
      @from = "&from=#{from.strftime("%F.%H:%M:%S")}"
      @to = "&to=#{to.strftime("%F.%H:%M:%S")}"
      @api = api
      @blocks = ""
    end

    def to_s
      "/QmStats/jsonStatsApi.do" + @queues + @from + @to + @blocks
    end

    def execute
      @api.call(to_s)
    end

    METHODS.each do 
      |k,v| define_method(k.to_sym) do 
        @blocks += "&block=#{v}"
        return self 
      end
    end

  end
end
