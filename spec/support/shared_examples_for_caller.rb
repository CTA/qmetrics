RSpec.shared_examples 'a Qmetrics::Caller' do |config_obj|
  
  caller = described_class.new(config_obj.to_h)

  describe "#api_methods" do
    it "should exist" do
      expect{caller.api_methods}.not_to raise_exception
    end
  end

  caller.api_methods.each do |k,v|
    describe "##{k}" do
      before :all do
        @response = caller.public_send(k)
      end

      let(:response) { @response.dup }

      it "should return an API Response" do
        expect(response).to be_a(Qmetrics::Response)
      end

      it "should return a response with the API call's key" do
        expect(response.result).to have_key(k)
      end
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(caller.to_s).to be_a(String)
    end
  end

end