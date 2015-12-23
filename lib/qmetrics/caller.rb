module Qmetrics
  class Caller

    class << self 
      attr_reader :api_methods
    end

    def initialize(queues: , api: )
      @queues = queues
      @api = api
      clear_blocks
    end

    def get(*args)
      clear_blocks
      args.each do |k|
        @blocks.push(api_methods[k.to_sym]) if call_exists?(k.to_sym)
      end
      execute
    end

    # url encoded '|' to '%7C'
    def to_s
      "/jsonStatsApi.do?queues=#{@queues.join('%7C')}"
    end

    def self.load_api_methods(file)
      @api_methods ||= load_yml(file)
    end

    def api_methods
      self.class.api_methods
    end

    private
    
    def self.load_yml(file)
      YAML.load_file(File.join(File.dirname(__FILE__),file))
    end

    def self.generate_api_methods
      api_methods.each do |k, v| 
        define_method(k.to_sym) do
          @blocks = [v]
          execute
        end
      end
    end

    def execute
      Qmetrics::Response.new(@api.call(to_s),api_methods)
    end

    def call_exists?(call)
      api_methods.keys.include? call
    end

    def clear_blocks
      @blocks = []
    end

  end
end
