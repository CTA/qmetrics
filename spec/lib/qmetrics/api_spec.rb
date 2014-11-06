describe Qmetrics::API do

  let(:api) { Qmetrics::API.new(@api_config.to_h) }
  
  before :all do
    @api_config = APIConfig.new
  end
  
  describe "#new" do
    it "should return a new Qmetrics::API object" do
      expect(api).to be_a(Qmetrics::API)
    end
  end

  describe "#call" do
    context "it is passed invalid auth credentials" do

      it "should throw an exception" do
        api_config = {server: @api_config.server,
                      port: @api_config.port,
                      user: "foo", pass: "bar" }
        wrong_api = Qmetrics::API.new(api_config.to_h)
        expect{wrong_api.call("agent/jsonEditorApi.do")}.to raise_exception("501")
      end
    end

    context "it is passed an invalid api method" do
      it "should throw an exception" do
        expect{api.call("agt/jsonEditorApi.do")}.to raise_exception("500")
      end
    end

    context "it is passed a valid Queuemetrics api method" do
      it "should return an array" do
        expect(api.call("agent/jsonEditorApi.do")).to be_an(Array)
      end
    end

  end

  describe "#stats" do
    let(:q_stats) { { queues: [1],
                      from: Time.now-86400,
                      to: Time.now } }

    it "should return a Qmetrics::Stats object" do
      expect(api.stats(q_stats)).to be_an_instance_of(Qmetrics::Stats)
    end

  end

end

