# frozen_string_literal: true

module Schemify
  # Methods for converting between different naming conventions
  module Naming
    module_function

    def json_name(name)
      parts = name.to_s.split("_")
      parts[0].downcase + parts[1..].map(&:capitalize).join
    end

    def class_name(name)
      name.to_s.split("_").map(&:capitalize).join
    end
  end
end
