describe Qmetrics::Response do

  let(:api) { Qmetrics::API.new(@api_config.to_h)}
  let(:stats) { api.stats(@stats_config.to_h) }
  let(:response) { stats.get(:stints,:answered_calls,:all_calls) }

  before :all do
    @api_config = APIConfig.new
    @stats_config = StatsConfig.new
  end

  describe "#result" do
    it "should respond" do
      expect{response.result}.not_to raise_exception
    end

    context "The result is for multiple agents" do
      let(:result) { stats.answered_calls.result }

      it "should be an Array of Hashes" do
        expect(result[:answered_calls]).to be_an(Array)
        expect(result[:answered_calls].first).to be_a(Hash)
      end

    end

    context "The result is for all agents" do
      let(:result) { stats.all_calls.result } 

      it "should be a Hash" do
        expect(result[:all_calls]).to be_a(Hash)
      end

    end

  end

end
