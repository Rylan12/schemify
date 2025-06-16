# frozen_string_literal: true

require "schemify/naming"

RSpec.describe Schemify::Naming do
  describe "::json_name" do
    it "converts a snake_case string to camelCase" do
      expect(described_class.json_name("example_name")).to eq("exampleName")
    end

    it "converts a snake_case symbol to camelCase" do
      expect(described_class.json_name(:another_example_name)).to eq("anotherExampleName")
    end

    it "handles single word strings" do
      expect(described_class.json_name("example")).to eq("example")
    end

    it "handles single word symbols" do
      expect(described_class.json_name(:example)).to eq("example")
    end
  end

  describe "::class_name" do
    it "converts a snake_case string to camelCase" do
      expect(described_class.class_name("example_name")).to eq("ExampleName")
    end

    it "converts a snake_case symbol to camelCase" do
      expect(described_class.class_name(:another_example_name)).to eq("AnotherExampleName")
    end

    it "handles single word strings" do
      expect(described_class.class_name("example")).to eq("Example")
    end

    it "handles single word symbols" do
      expect(described_class.class_name(:example)).to eq("Example")
    end
  end
end
