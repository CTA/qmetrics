module QM
  class Caller
    attr_reader :blocks, :api_methods

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

    def load_api_methods(file)
      @api_methods ||= load_yml(file)
    end

    private
    
    def load_yml(file)
      YAML.load_file(File.join(File.dirname(__FILE__),file))
    end

    def generate_api_methods
      api_methods.each do |k,v| 
        self.class.send(:define_method,k.to_sym) do
          @blocks.push v
          execute
        end
      end
    end

    def execute
      QM::Response.new(@api.call(to_s),api_methods)
    end

    def call_exists?(call)
      @api_methods.keys.include? call
    end

  end
end
