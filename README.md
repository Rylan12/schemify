# Schemify

Use Ruby code to generate JSON schemas with intelligent defaults, validation, and versioning.

> [!WARNING]
> This gem is in the _very_ early stages of development, and is not yet ready for general use.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add schemify
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install schemify
```

## Usage

More elegant usage will be added in the future. For now, a schema can be created using:

```ruby
schema = Schemify::Schema.new do
  schema "https://json-schema.org/draft/2020-12/schema"
  id "https://example.com/product.schema.json"

  title "Product"
  description "A product from Acme's catalog"

  type "object"
  properties({
               "productId" => {
                 "description" => "The unique identifier for a product",
                 "type" => "integer"
               },
               "productName" => {
                 "description" => "Name of the product",
                 "type" => "string"
               },
               "price" => {
                 "description" => "The price of the product",
                 "type" => "number",
                 "exclusiveMinimum" => 0
               },
               "tags" => {
                 "description" => "Tags for the product",
                 "type" => "array",
                 "items" => {
                   "type" => "string"
                 },
                 "minItems" => 1,
                 "uniqueItems" => true
               }
             })
  required %w[productId productName price]
end

# Ruby hash representation of the schema
schema.to_h

# JSON representation of the schema
JSON.generate(schema.to_h)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Rylan12/schemify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Rylan12/schemify/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Schemify project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Rylan12/schemify/blob/main/CODE_OF_CONDUCT.md).
