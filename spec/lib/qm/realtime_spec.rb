describe QM::Realtime do
  let(:realtime) { QM::Realtime.new(@realtime_config.to_h) }

  before :all do
    @realtime_config = RealtimeConfig.new
  end

  describe "api_methods" do
    it "should exist" do
      expect(realtime.api_methods).not_to be_nil
    end
  end

  describe "any instance" do
    it "should ensure api methods add JAVA method calls to @blocks" do
      realtime.send(realtime.api_methods.first.first)
      expect(realtime.blocks.first).to eq(realtime.api_methods.first.last)
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(realtime.to_s).to be_a(String)
    end

    it "should be in the form of a correct Queuemetrics API call" do
      expected_response = "/QmRealtime/jsonStatsApi.do"  +
        "?queues=#{@realtime_config.queues.join("|")}"
      expect(realtime.to_s).to include(expected_response)
    end
  end

end
