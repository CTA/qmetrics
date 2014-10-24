module QM
  class Realtime < Caller
    load_api_methods("realtime_methods.yml")
    generate_api_methods

    def to_s
      "/QmRealtime" + super +
      @blocks.map {|b| "&block=#{b}"}.join
    end

  end
end
