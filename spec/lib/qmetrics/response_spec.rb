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

    it "should remove HTML character entities from output" do
      result = stats.agent_payable_time_by_hour.result
      result[:agent_payable_time_by_hour].each do |n|
        n.each do |k,v|
          expect(k).to_not include("&nbsp;")
          expect(v).to_not include("&nbsp;")
          expect(k).to_not include("&lt;")
          expect(v).to_not include("&lt;")
        end
      end
    end

    it "should remove superflous key-value pairs" do
      result = stats.unanswered_calls_details.result
      junk = ["...","-",""]
      result[:unanswered_calls_details].each do |n|
        n.each do |k,v|
          if junk.include?(k)
            expect(junk).not_to include(v)
          elsif junk.include?(v)
            expect(junk).not_to include(k)
          end 
        end
      end
    end

  end

end
