describe QM::Realtime do
  let(:realtime) { QM::Realtime.new(@realtime_config.to_h) }

  before :all do
    @realtime_config = RealtimeConfig.new
  end

  describe "METHODS constant" do
    it "should exist" do
      expect(described_class::METHODS).not_to be_nil
    end

  end

  describe "any instance" do
    it "should ensure api methods add JAVA method calls to @blocks" do
      realtime.send(described_class::METHODS.first.first)
      expect(realtime.blocks).to eq("&block=#{described_class::METHODS.first.last}")
    end
  end

  described_class::METHODS.each do |k,v|
    describe "##{k}" do
      it "should return a proper Queuemetrics API response" do
        expect(realtime.send(k)).to have_key(v)
      end
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

