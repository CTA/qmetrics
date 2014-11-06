describe Qmetrics::Response do

  let(:stats) { Qmetrics::Stats.new(@stats_config.to_h) }
  let(:api_methods) { stats.api_methods }
  let(:response) { stats.get(:stints,:answered_calls) }

  before :all do
    @stats_config = StatsConfig.new
  end

  describe "#result" do
    it "should respond" do
      expect{response.result}.not_to raise_exception
    end

    it "should be a Hash" do
      expect(response.result).to be_a(Hash)
    end

  end

end
