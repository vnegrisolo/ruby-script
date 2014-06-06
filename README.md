# Deprecated

I created this gem to help me create ruby scripts, and then I found Thor[https://github.com/erikhuda/thor].
In fact this gem is a nice study case for a DSL implementation.

# RubyScript

Build your scripts easy and with the ruby power.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_script', git: 'https://github.com/vnegrisolo/ruby_script.git'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_script

## Usage

- configure:

```ruby
require 'ruby_script'

RubyScript.configure do |conf|
  conf.log_datetime = false
end
```

Write the following code to create your script:

- execute:
```ruby
require 'ruby_script'

RubyScript.execute(:path, :user) do
  p "use params[:your_param] to get the value passed to the script - actual params=#{params.inspect}"
  call "ls -la #{params[:path]}"
end
```

The params the execute method receive is the mandatory ones your script demands.

## Methods Supported

* `call(command)` - run any shell command
* `link_file(folder_from, folder_to, file)` - create a symbol link
* `link_files(folder_from, folder_to)` - create some symbol links

## Contributing

1. Fork it ( http://github.com/vnegrisolo/ruby_script/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
