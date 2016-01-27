# Qmetrics

Qmetrics is a gem that wraps the Queuemetrics JSON API with Ruby!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qmetrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qmetrics

## Usage

Note that this gem is unfinished! Things still need to be tweaked and tested.

```ruby
api = Qmetrics::API.new(server: 192.168.1.101, port: 80, user: "foo", pass: "bar")
api.stats(queue: [4343], from: Time.now-86400, to: Time.now)

p api.stats.all_calls.result
#=> #<Qmetrics::Response:0x007feac2bdada8 @status="OK", @description="", @time_elapsed="109ms", @qmetrics_version="14.06.2", @result={:all_calls=>{"All calls:"=>"&nbsp;", "N. calls answered by operators:"=>"1,477", "Average call length:"=>"387.1 s.", "Min call length:"=>"0:00", "Max call length:"=>"1:22:45", "Total call length:"=>"158.8 H", "Average call waiting time:"=>"20.8 s.", "Min waiting time:"=>"0:01", "Max waiting time:"=>"7:54", "Total waiting time:"=>"8.6 H", "Average initial position"=>"1.5", "Min initial position"=>"1", "Max initial position"=>"7", "Coverage"=>"99.9%"}}
```

## Supported Methods

### Stats

  - all_calls
  - calls_within
  - agents_on_queue
  - service_level_agreement
  - disconnection_causes
  - transfers
  - answered_calls_by_queue
  - answered_calls_by_direction
  - stints
  - initial_queue_positions
  - ivr_selections
  - dnis
  - music_on_hold_by_agent
  - report_header
  - answered_calls_details
  - ivr_details
  - all_unanswered_calls
  - unanswered_calls_within
  - disconnection_causes
  - unanswered_by_queue
  - unanswered_outbound_calls
  - unanswered_by_length
  - inclusive_sla
  - unanswered_by_key_press
  - unanswered_stints
  - all_calls_by_stints
  - all_calls_initial_queue_position
  - lost_calls_ivr_selections
  - all_calls_ivr_selections
  - lost_calls_dnis
  - all_calls_dnis
  - call_overview
  - inclusive_answered_sla
  - unanswered_calls_details
  - area_code_report
  - answered_calls_by_area
  - inbound_acd_call_attempts
  - acd_attempts_by_queue
  - acd_attempts_by_terminal
  - answered_call_distribution_by_day
  - answered_call_wait_time_per_day
  - unanswered_call_wait_time_per_day
  - sales_per_day
  - schedule_adherence_per_day
  - queue_length_per_day
  - inclusive_sla_per_day
  - traffic_analysis_per_day
  - answered_call_distribution_per_hour
  - answered_call_wait_time_per_hour
  - unanswered_call_wait_time_per_hour
  - sales_per_hour
  - schedule_adherence_per_hour
  - queue_length_per_hour
  - inclusive_sla_per_hour
  - traffic_analysis_per_hour
  - answered_call_distribution_per_day_of_week
  - answered_call_wait_time_per_day_of_week
  - unanswered_call_wait_time_per_day_of_week
  - sales_per_day_of_week
  - schedule_adherence_per_day_of_week
  - queue_length_per_day_of_week
  - inclusive_sla_per_day_of_week
  - traffic_analysis_per_day_of_week
  - agent_session_detail
  - session_and_pause_durations
  - agent_availability
  - answered_calls
  - answered_calls_by_custom_group
  - answered_calls_by_location
  - answered_calls_by_service_group
  - agent_performance_by_acd_group
  - agent_occupancy_report
  - agent_payable_time_by_hour
  - agent_billable_time_by_hour
  - detail_of_agent_sessions
  - detail_of_agent_pauses
  - outcomes
  - call_results_by_outcomes
  - billable_activities
  - non_billable_activities
  - detailed_agent_report
  - outcomes_per_agent
  - ivr_traversals
  - ivr_timing
  - ivr_goals

### Realtime

  - queues_in_use
  - calls_being_processed
  - agents_logged_in
  - wallboard_top_panel
  - wall_calls_being_processed
  - visitor_calls_processed
  - calls_taken
  - calls_lost
  - raw_agent_panel
  - raw_calls_panel

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Qmetrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
