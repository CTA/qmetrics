describe QM::Response do

  let(:stats) { QM::Stats.new(@stats_config.to_h) }
  let(:api_methods) { stats.api_methods }
  let(:response) do
    QM::Response.new(stats.get(:stints,:answered_calls),api_methods)
  end

  before :all do
    @stats_config = StatsConfig.new
  end

  describe "#result" do
    it "should respond" do
      expect{response}.not_to raise_exception
    end

    it "should be a Hash" do
      expect(response.result).to be_an(Hash)
    end

  end

end
