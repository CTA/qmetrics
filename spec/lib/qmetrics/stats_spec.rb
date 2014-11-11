require 'support/shared_examples_for_caller'

stats_config = StatsConfig.new

describe Qmetrics::Stats do
  it_behaves_like 'a Qmetrics::Caller', stats_config
end
