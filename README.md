## bearychat-rb

Simple ruby library to interact with [Bearychat](https://bearychat.com/)

## Installation

Add this line to your application's Gemfile:

```
gem 'bearychat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bearychat

## Usage

### Common

Check bearychat [incoming API](https://github.com/bearyinnovative/bearychat-tutorial/blob/master/robots/incoming.md)

```
require 'bearychat'
incoming = Bearychat.incoming('hook_uri')
incoming.text = "Willllll"
incoming.markdown = true
incoming.attachments << {"title"=>"Professor John Frink=>", "text"=>"Numbers are fun. ", "color"=>"#ffa500", "images"=>[{"url"=>"http://img3.douban.com/icon/ul15067564-30.jpg"}]}

incoming.send
```

### Capistrano3(git)

```
require 'bearychat/capistrano'

set :bearychat_hook, your_bearychat_hook_uri
```

# options
```
#default: true
set :bearychat_enabled

#default: #E51C23
set :bearychat_failed_color

#default: #259B24
set :bearychat_successed_color

#default: #FFC107
set :bearychat_starting_color
```

## TODO

* show git revision in starting
* Capistrano2 support
* not only Capistrano
* test


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

