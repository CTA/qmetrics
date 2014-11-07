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

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Qmetrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
