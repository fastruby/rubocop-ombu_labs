# RuboCop::OmbuLabs

This gem adds rules to RuboCop to detect misspelled OmbuLabs and FastRuby.io names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-ombu_labs', require: false, github: "fastruby/rubocop-ombu_labs"
```

And then execute:

    $ bundle install

## Usage

Add the RuboCop extension in its config file:

```
require:
  - rubocop-ombu_labs

OmbuLabs/Branding:
  Enabled: true
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RuboCop::OmbuLabs project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubocop-ombu_labs/blob/master/CODE_OF_CONDUCT.md).
