# frozen_string_literal: true

require_relative "vocabularies"

module Schemify
  # A JSON Schema representation
  class Schema
    include Vocabularies::Core::KeywordMethods
    include Vocabularies::Applicator::KeywordMethods
    include Vocabularies::Unevaluated::KeywordMethods
    include Vocabularies::Validation::KeywordMethods
    include Vocabularies::MetaData::KeywordMethods
    include Vocabularies::FormatAnnotation::KeywordMethods
    include Vocabularies::Content::KeywordMethods

    def initialize(&)
      @keywords = {}
      instance_eval(&) if block_given?
    end

    def to_h
      schema = {}
      @keywords.each_value do |keyword|
        schema.merge!(keyword.to_h)
      end
      schema
    end
  end
end
