# Core

TODO: Write a gem description

## Model: Order
### State machine

    #              | new         | issued      | paid        | processing  | closed      | canceled    |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | new        |      *      |  Y          |             |             |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | issued     |             |             |  Y          |  Y          |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | paid       |             |             |             |  Y          |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | processing |             |             |             |             |  Y          |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | closed     |             |             |             |             |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | canceled   |  N          |  N          |  N          |  N          |  N          |  N          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *

## Installation

Add this line to your application's Gemfile:

    gem 'core'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install core

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
