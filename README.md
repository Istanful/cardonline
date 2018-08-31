# Cardonline

This gem is a simple wrapper around the cardonline API. You can find their
documentation [here](http://cardonline.se/doc/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cardonline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cardonline

## Usage

### Installation
The only installation needed is adding the username and password to be used in
the API. The client will perform basic auth to perform the requests.

```ruby
Cardonline.configure do |config|
  config.username = "username"
  config.password = "password"
end
```

This gem follows the `Safettp` pattern for perform requests, which means you
have to provide a path for both the success state and the failure state. You can
read more [here](https://github.com/Istanful/safettp).
```ruby
Cardonline.get_card(1) do |result|
  result.on_success do |response|
    puts response.parsed_body
  end

  result.on_failure do |response|
    puts response.http_response.code
  end
end
```

### Get a card
Fetch a card with the provided id.
```ruby
Cardonline.get_card(1) do |result|
  result.on_success do |response|
  end

  result.on_failure do |response|
  end
end
```

Add a card with the provided attributes.
```ruby
Cardonline.add_card({ name: 'Christian' }) do |result|
  result.on_success do |response|
  end

  result.on_failure do |response|
  end
end
```

Update a card with the provided id with the provided attributes.
```ruby
Cardonline.update_card(1, { name: 'James' }) do |result|
  result.on_success do |response|
  end

  result.on_failure do |response|
  end
end
```

Retrieve the performed orders.
```ruby
Cardonline.get_orders do |result|
  result.on_success do |response|
  end

  result.on_failure do |response|
  end
end
```

Retrieve a specific order.
```ruby
Cardonline.get_order(1) do |result|
  result.on_success do |response|
  end

  result.on_failure do |response|
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/istanful/cardonline.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
