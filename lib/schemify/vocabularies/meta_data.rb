# frozen_string_literal: true

require_relative "../keyword"

module Schemify
  module Vocabularies
    # The meta-data vocabulary defined by the JSON Schema specification
    module MetaData
      extend Keyword::Builder

      # https://json-schema.org/draft/2020-12/json-schema-validation#section-9
      KEYWORDS = %i[title description default deprecated read_only write_only examples].freeze

      setup_vocabulary KEYWORDS
      setup_keyword_classes [:abc_def]
    end
  end
end
