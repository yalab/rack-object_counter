# Rack::ObjectCounter

Memory increase profiler for rack app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-object_counter', require: 'rack/object_counter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-object_counter

## Usage

### rails

Write to config/initializers/object_counter.rb

```
Rails.application.config.middleware.use Rack::ObjectCounter
Rack::ObjectCounter.logger = Rails.logger
```

### rack app

Write to config.ru

```
require 'logger'
use Rack::ObjectCounter
Rack::ObjectCounter.logger = Logger.new(STDOUT)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yalab/rack-object_counter.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

