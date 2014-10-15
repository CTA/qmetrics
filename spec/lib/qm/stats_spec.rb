describe QM::Stats do

  let(:stats) { QM::Stats.new(@stats_config.to_h) }

  before :all do
    @stats_config = StatsConfig.new
  end

  describe "METHODS constant" do
    it "should exist" do
      expect(described_class::METHODS).not_to be_nil
    end
  end

  describe "any instance" do
    it "should ensure defined methods add JAVA method calls to @blocks" do
      stats.stints
      expect(stats.blocks).to eq("&block=OkDO.StintsOk")
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(stats.to_s).to be_a(String)
    end

    it "should be in the correct form for an API call" do
    end
  end

  describe "#execute" do
    it "should not throw an error" do
      stats.stints
      expect{stats.execute}.to_not raise_exception
    end

    it "should return a parsed response" do
    end
  end

end
