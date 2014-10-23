module QM
  class Realtime < Caller

    def initialize(args)
      super
      load_api_methods("realtime_methods.yml")
      generate_api_methods
    end

    def to_s
      "/QmRealtime" + super +
      @blocks.map {|b| "&block=#{b}"}.join
    end

  end
end
