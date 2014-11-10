describe Qmetrics::Response do

  let(:api) { Qmetrics::API.new(@api_config.to_h)}
  let(:stats) { api.stats(@stats_config.to_h) }
  let(:response) { stats.get(:all_calls,:stints,:answered_calls) }

  before :all do
    @api_config = APIConfig.new
    @stats_config = StatsConfig.new
  end

  describe "#result" do
    it "should respond" do
      expect{response.result}.not_to raise_exception
    end

    it "should be a Hash" do
      p response
      expect(response.result).to be_a(Hash)
    end

  end

end
