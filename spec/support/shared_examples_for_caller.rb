RSpec.shared_examples 'a QM::Caller' do |config_obj|
  
  caller = described_class.new(config_obj.to_h)

  describe "#api_methods" do
    it "should exist" do
      expect{described_class.api_methods}.not_to raise_exception
    end
  end

  caller.api_methods.each do |k,v|
    describe "##{k}" do
      it "should exist" do
        expect{caller.public_send(k)}.not_to raise_exception
      end

      it "should return an API Response" do
        expect(caller.public_send(k)).to be_a(QM::Response)
      end

      it "should return a response with the API call's key" do
        expect(caller.public_send(k).result).to have_key(k)
      end
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(caller.to_s).to be_a(String)
    end
  end

end