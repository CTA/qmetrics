require 'yaml'

module QM
  class Realtime
    attr_reader :blocks

    METHODS = YAML.load_file(File.join(File.dirname(__FILE__),
                                       "realtime_methods.yml"))

    def initialize(queues: , api: )
      @queues = "?queues=#{queues.join("|")}"
      @api = api
      @blocks = ""
    end

    METHODS.each do
      |k,v| define_method(k) do
        @blocks = "&block=#{v}" 
        execute
      end
    end

    def to_s
      "/QmRealtime/jsonStatsApi.do" + @queues + @blocks
    end

    private

    def execute
      @api.call(to_s)
    end

  end

end
