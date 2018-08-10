require "rails"
require "administrate/field/globalize/string"

module Administrate
  module Field
    module Globalize
      class Engine < ::Rails::Engine
        initializer "administrate-field-globalize.patch", before: :load_config_initializers do |app|
          Administrate::Search.class_eval do
            def tables_to_join
              attribute_types.keys.select do |attribute|
                attribute_types[attribute].searchable? && association_search?(attribute)
              end + translation_join
            end

            def translation_join
              return [] unless attribute_types.values.any? do |field|
                field.respond_to?(:translation?) && field.translation?
              end
              [:translations]
            end

            def query_table_name(attr)
              if attribute_types[attr].respond_to?(:translation?)
                ActiveRecord::Base.connection.
                  quote_table_name(
                    "#{@scoped_resource.table_name.singularize}_translations",
                )
              elsif association_search?(attr)
                ActiveRecord::Base.connection.quote_table_name(attr.to_s.pluralize)
              else
                ActiveRecord::Base.connection.
                  quote_table_name(@scoped_resource.table_name)
              end
            end
          end
        end
      end
    end
  end
end
