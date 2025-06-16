# frozen_string_literal: true

require_relative "naming"

module Schemify
  # Represents a keyword in a schema, which can be used to define metadata or properties
  class Keyword
    def initialize(value)
      @value = value
    end

    def to_h
      { self.class.json_name => @value }
    end

    class << self
      def json_name(value = nil, dollar_prefix: false)
        return @json_name if value.nil?

        @json_name = if dollar_prefix
                       "$#{Naming.json_name(value)}"
                     else
                       Naming.json_name(value)
                     end
      end
    end

    # Dynamically create Keyword subclasses and methods
    module Builder
      def setup_vocabulary(keyword_names, dollar_prefix: false)
        setup_keyword_classes keyword_names, dollar_prefix: dollar_prefix
        setup_keyword_methods_module keyword_names
      end

      private

      def setup_keyword_classes(names, dollar_prefix: false)
        names.each do |name|
          klass = Class.new(Keyword) do
            json_name name, dollar_prefix: dollar_prefix
          end
          const_name = Naming.class_name(name)
          const_set(const_name, klass)
        end
      end

      def setup_keyword_methods_module(names)
        namespace = self
        mod = create_module(names, namespace)
        const_set(:KeywordMethods, mod)
      end

      def create_module(names, namespace)
        Module.new do
          names.each do |name|
            klass = namespace.const_get(Naming.class_name(name))
            define_method(name) do |value|
              @keywords[name] = klass.new(value)
            end
          end
        end
      end
    end
  end
end
