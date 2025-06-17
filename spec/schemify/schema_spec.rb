# frozen_string_literal: true

require "schemify/naming"

RSpec.describe Schemify::Schema do
  subject(:empty_schema) { described_class.new }

  let(:schema) do
    described_class.new do
      title "Example Schema"
      description "This is an example schema."
      default "default value"
      deprecated true
      read_only false
      write_only true
      examples %w[example1 example2]
    end
  end

  let(:expected_hash) do
    {
      "title"       => "Example Schema",
      "description" => "This is an example schema.",
      "default"     => "default value",
      "deprecated"  => true,
      "readOnly"    => false,
      "writeOnly"   => true,
      "examples"    => %w[example1 example2],
    }
  end

  it "creates a schema as expected" do
    expect(schema.to_h).to eq(expected_hash)
  end

  it "allows setting and retrieving keywords" do
    empty_schema.title "New Title"
    expect(empty_schema.to_h).to eq({ "title" => "New Title" })
  end
end
