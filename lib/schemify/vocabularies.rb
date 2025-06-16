# frozen_string_literal: true

require_relative "keyword"

module Schemify
  module Vocabularies
    # The core vocabulary defined by the JSON Schema specification
    module Core
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/core
      KEYWORDS = %i[id schema ref anchor dynamic_ref dynamic_anchor vocabulary comment defs].freeze

      setup_vocabulary KEYWORDS, dollar_prefix: true
    end

    # The applicator vocabulary defined by the JSON Schema specification
    module Applicator
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/applicator
      KEYWORDS = %i[prefix_items items contains additional_properties properties pattern_properties dependent_schemas
                    property_names if then else all_of any_of one_of not].freeze

      setup_vocabulary KEYWORDS
    end

    # The unevaluated vocabulary defined by the JSON Schema specification
    module Unevaluated
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/unevaluated
      KEYWORDS = %i[unevaluated_items unevaluated_properties].freeze

      setup_vocabulary KEYWORDS
    end

    # The validation vocabulary defined by the JSON Schema specification
    module Validation
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/validation
      KEYWORDS = %i[type const enum multiple_of maximum exclusive_maximum minimum exclusive_minimum
                    max_length min_length pattern max_items min_items unique_items max_contains
                    min_contains max_properties min_properties required dependent_required].freeze

      setup_vocabulary KEYWORDS
    end

    # The meta-data vocabulary defined by the JSON Schema specification
    module MetaData
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/meta-data
      KEYWORDS = %i[title description default deprecated read_only write_only examples].freeze

      setup_vocabulary KEYWORDS
    end

    # The unevaluated vocabulary defined by the JSON Schema specification
    module FormatAnnotation
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/format-annotation
      KEYWORDS = %i[format].freeze

      setup_vocabulary KEYWORDS
    end

    # The unevaluated vocabulary defined by the JSON Schema specification
    module Content
      extend Keyword::Builder

      # See https://json-schema.org/draft/2020-12/meta/content
      KEYWORDS = %i[content_encoding content_media_type content_schema].freeze

      setup_vocabulary KEYWORDS
    end
  end
end
