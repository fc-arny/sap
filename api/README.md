# Sap::Api

## Responding JSON format

        status: (error | fail | success), # Error - unexpected, fail - caught error, form data or etc, success - OK
        errors: [],                       # Error messages (ex.: Wrong login or password)
        data: {
            param1: value1,               # ................
            param2: value2,               # Meta params    .
            param2: value3,               # ................
            ...
            result: ([...] | {...})       # Model object or objects 
        }

## Installation

Add this line to your application's Gemfile:

    gem 'sap_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sap_api

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
