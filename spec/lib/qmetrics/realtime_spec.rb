realtime_config = RealtimeConfig.new

describe Qmetrics::Realtime do
  it_behaves_like 'a Qmetrics::Caller', realtime_config
end
