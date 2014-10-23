module QM
  class Stats < Caller

    def initialize(from: , to: , **args)
      super(args)
      @from = from
      @to = to
      load_api_methods("stats_methods.yml")
      generate_api_methods
    end

    def to_s
      "/QmStats" + super +
      "&from=#{@from.strftime("%F.%H:%M:%S")}" \
      "&to=#{@to.strftime("%F.%H:%M:%S")}" +
      @blocks.map {|b| "&block=#{b}"}.join
    end

  end
end
