require 'yaml'

module QM
  class Stats
    attr_reader :blocks

    METHODS = YAML.load_file(File.join(File.dirname(__FILE__),
                                        "stats_methods.yml"))    

    def initialize(queues: , from: , to: )
      @queues = "?queues=#{queues.join("|")}" 
      @from = "&from=#{from.strftime("%F.%H:%M:%S")}"
      @to = "&to=#{to.strftime("%F.%H:%M:%S")}"
      @blocks = ""
    end

    def to_s
      "/QmStats/jsonStatsApi.do" + @queues + @from + @to + @blocks
    end

    METHODS.each { |k,v| define_method(k.to_sym) { @blocks += "&block=#{v}" } }

  end
end
