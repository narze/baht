# Baht [![Build Status](https://cloud.drone.io/api/badges/narze/baht/status.svg)](https://cloud.drone.io/narze/baht)

Convert number to Thai Baht format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baht'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baht

## Usage

```ruby
Baht.words(9000)
=> "เก้าพันบาทถ้วน"
Baht.words(3.5)
=> "สามบาทห้าสิบสตางค์"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/narze/baht. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Baht project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/narze/baht/blob/master/CODE_OF_CONDUCT.md).
