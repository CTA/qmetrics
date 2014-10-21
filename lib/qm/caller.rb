module QM
  class Caller
    attr_reader :blocks

    def initialize(queues: , api: )
      @queues = queues
      @api = api
      @blocks = []
    end

    def get(*args)
      args.each do |k|
        @blocks.push(@api_methods[k.to_sym]) if call_exists?(k.to_sym)
      end
      execute
    end

    def to_s
      "/jsonStatsApi.do?queues=#{@queues.join("|")}"
    end

    def api_methods(file)
      @api_methods ||= load_yml(file)
    end

    private

    def execute
      @api.call(to_s)
    end

    def call_exists?(call)
      @api_methods.keys.include? call
    end

    def self.load_yml(file)
      YAML.load_file(File.join(File.dirname(__FILE__),file))
    end

  end
end
