# Prebundle



## Installation

Run this line on your shell:

```sh
gem install prebundle
```

## Usage

prebundle is a CLI tool.

Execute at the same directory of Gemfile like this:

    $ prebundle all

Or specify gem name:

    $ prebundle gem mysql2

Both simply shows shell command and do nothing (for security reason).
After checking the output, you pipe to sh like this:

    $ prebundle all | sudo sh

## Contributing

If your problem did not solved by prebundle, please [create new issue](https://github.com/kuboon/prebundle/issues/new?assignees=kuboon&labels=&template=add-gem-package-info.md&title=[add]).

Other bug reports and pull requests are welcome on GitHub at https://github.com/kuboon/prebundle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Prebundle project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kuboon/prebundle/blob/master/CODE_OF_CONDUCT.md).
