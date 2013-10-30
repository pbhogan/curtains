# Curtains

Curtains provides simple model decorators for Rails 4.

## Installation

Add this line to your application's `Gemfile`:

	gem "curtains"

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install curtains

## Usage

In either controllers or views you may call `decorate` to wrap a model in a decorator. The name of the decorator class is inferred from the name of the model, so for example, the `Address` model will be wrapped with `AddressDecorator`.

```erb
# app/views/addresses/show.html.erb
<%= decorate(@address).formatted_address_tag %>
```

The `decorate` helper also supports enumerable collections and will return an array of decorated objects:

```erb
# app/views/addresses/index.html.erb
<%= decorate(@addresses).each do |address| %>
	<%= address.formatted_address_tag %>
<% end %>
```

Additionally, the `decorate` helper yields its result to a block if provided:

```erb
# app/views/addresses/show.html.erb
<%= decorate(@address) do |address| %>
	<div class="name">
		<%= address.formatted_name %>
	</div>
	<%= address.formatted_address_tag %>
<% end %>
```

These decorators should be placed in the `app/decorators` folder and should inherit from `Curtains::Decorator`. For example:

```ruby
# app/decorators/address_decorator.rb
class AddressDecorator < Curtains::Decorator
	def formatted_address_tag
		content_tag :address, address.lines.join("<br/>").html_safe
	end

	def formatted_name
		return "N/A" if name.blank?
		name
	end
end
```

## Inherited Resources Compatibility

Call `decorate_resources` in your controller to add automatic decorating to the `resource`, `build_resource` and `collection` methods provided by Inherited Resources:

```ruby
# app/controllers/address_controller.rb
class AddressesController < InheritedResources::Base
  decorate_resources
end
```

```erb
# app/views/addresses/show.html.erb
<%= resource.formatted_address_tag %>
```

## Meta

Handcrafted by Patrick Hogan [[github](http://github.com/pbhogan)]

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
