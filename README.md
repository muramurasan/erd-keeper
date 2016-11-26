# Fresh::Erd

Introduction.(TBD)

## Preview

TBD(img)

## Requirements

- Ruby 2.0.0+
- ActiveRecord 3.x
- rails-erd 1.1.0+


## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'fresh_erd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fresh_erd

## Usage

Create configuration file for 'fresh_erd':

```yml
diagrams:
  tweet:
    - User
    - Micropost
  all:
    - User
    - Micropost
    - Relationship
```

And then execute:

    $ bundle exec fresh_erd


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
