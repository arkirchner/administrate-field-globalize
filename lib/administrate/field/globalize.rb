require "rails"
require "administrate/field/globalize/string"
require "administrate/field/globalize/text"

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
                provided_class_name = attribute_types[attr].options[:class_name]
                unquoted_table_name =
                  if provided_class_name
                    Administrate.warn_of_deprecated_option(:class_name)
                    provided_class_name.constantize.table_name
                  else
                    @scoped_resource.reflect_on_association(attr).klass.table_name
                  end
                ActiveRecord::Base.connection.quote_table_name(unquoted_table_name)
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
