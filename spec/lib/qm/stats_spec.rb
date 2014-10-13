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

end
