describe QM::Response do

  let(:stats) { QM::Stats.new(@stats_config.to_h) }
  let(:response) { QM::Response.new(stats.stints) }

  before :all do
    @stats_config = StatsConfig.new
  end

  describe "#response" do
    it "should respond" do
      expect{response}.not_to raise_exception
    end

    it "should be an Array of Hashes" do
      expect(response.result).to be_an(Array)
      expect(response.result.first).to be_a(Hash)
    end

  end

end
