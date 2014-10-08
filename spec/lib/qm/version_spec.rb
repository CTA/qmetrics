require 'spec_helper'

describe QM do
  it "should define its version" do
    expect(QM::VERSION).not_to be_nil
  end
end

