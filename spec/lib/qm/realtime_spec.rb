realtime_config = RealtimeConfig.new

describe QM::Realtime do
  it_behaves_like 'a QM::Caller', realtime_config
end
