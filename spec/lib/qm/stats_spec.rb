describe QM::Stats do

  let(:stats) { QM::Stats.new(@stats_config.to_h) }

  before :all do
    @stats_config = StatsConfig.new
  end

  describe "METHODS constant" do
    it "should exist" do
      expect(stats.api_methods).not_to be_nil
    end
  end

  describe "any instance" do
    it "should ensure api methods add JAVA method calls to @blocks" do
      stats.send(stats.api_methods.first.first)
      expect(stats.blocks.first).to eq(stats.api_methods.first.last)
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(stats.to_s).to be_a(String)
    end

    it "should be in the form of a correct Queuemetrics API call" do
      expected_response = "/QmStats/jsonStatsApi.do" + 
        "?queues=#{@stats_config.queues.join("|")}" +
        "&from=#{@stats_config.from.strftime('%F.%H:%M:%S')}" +
        "&to=#{@stats_config.to.strftime('%F.%H:%M:%S')}"

      expect(stats.to_s).to include(expected_response)
    end
  end

end
