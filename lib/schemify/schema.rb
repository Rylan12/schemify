# frozen_string_literal: true

require_relative "vocabularies/meta_data"

module Schemify
  # A JSON Schema representation
  class Schema
    include Vocabularies::MetaData::KeywordMethods

    def initialize(&)
      @keywords = {}
      instance_eval(&) if block_given?
    end

    def to_h
      schema = {}
      @keywords.each_value do |keyword|
        schema.merge!(keyword.to_h) if keyword
      end
      schema
    end
  end
end
