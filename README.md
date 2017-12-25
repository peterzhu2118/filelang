# Filelang [![Build Status](https://travis-ci.org/peterzhu2118/filelang.svg?branch=master)](https://travis-ci.org/peterzhu2118/filelang) [![Gem Version](https://badge.fury.io/rb/filelang.svg)](https://badge.fury.io/rb/filelang)

A simple library to find the programming language of a file through the extension of the path.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'filelang'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filelang

## Usage

Two steps:
1. Require it: `require 'filelang'`
2. Call the method: `Filelang.file_language(path)` where `path` is the path of the file as a string

## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome.
