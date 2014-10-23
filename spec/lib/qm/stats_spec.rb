require 'support/shared_examples_for_caller'

stats_config = StatsConfig.new

describe QM::Stats do
  it_behaves_like 'a QM::Caller', stats_config
end
