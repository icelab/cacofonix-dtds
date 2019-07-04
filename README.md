# Cacofonix::DTDs

Cacofonix::DTDs provides an XML catalog for locally accessible ONIX 2.0 and 2.1 DTDs.

This is important in order to parse ONIX files correctly and reliably given that the original DTDs are no longer online.

This gem was published for use by [Cacofonix][cacofonix], a complete ONIX mapping gem. Cacofonix will use these DTDs automatically, no extra configuration required.

You can also use it directly with [Nokogiri][nokogiri] or any other libxml-based system. For this, see the installation and usage instructions below.

[cacofonix]: https://github.com/icelab/cacofonix
[nokogiri]: https://nokogiri.org

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "cacofonix-dtds"
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install cacofonix-dtds
```

## Usage

To set the `XML_CATALOG_FILES` environment variable to the XML catalog file:

```ruby
require "cacofonix/dtds"

Cacofonix::DTDs.apply_libxml_env!

# Do your nokogiri parsing here
```

If you want to clean up your environment afterwards:

```ruby
require "cacofonix/dtds"

env_value = nil

Cacofonix::DTDs.apply_libxml_env! { |previous_value| env_value = previous_value }

# Do your nokogiri parsing here

ENV[Cacofonix::DTDs.libxml_env_key] = env_value
```

## Contributing

Bug reports and pull requests are welcome [on GitHub](https://github.com/icelab/cacofonix-dtds). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cacofonix::DTDs codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/icelab/cacofonix-dtds/blob/master/CODE_OF_CONDUCT.md).
