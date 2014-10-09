describe QM::API do

  let(:api) { QM::API.new(@api_config.to_h) }
  
  before :all do
    @api_config = APIConfig.new
  end
  
  describe ".new" do
    it "should return a new QM::API object" do
      expect(api).to be_a(QM::API)
    end
  end

  describe ".call" do
    context "it is passed invalid auth credentials" do

      it "should throw an exception" do
        api_config = {server: @api_config.server,
                      port: @api_config.port,
                      user: "foo", pass: "bar" }
        wrong_api = QM::API.new(api_config.to_h)
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

end

