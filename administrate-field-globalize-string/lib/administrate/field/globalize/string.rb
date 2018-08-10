require "administrate/field/base"
require "rails"

module Administrate
  module Field
    module Globalize
      class String < Administrate::Field::Base
        class Engine < ::Rails::Engine
        end

        def self.permitted_attribute(attr, _options = nil)
          I18n.available_locales.map { |locale| "#{attr}_#{locale.downcase}" }
        end

        def truncate
          data.to_s[0...truncation_length]
        end

        private

        def truncation_length
          options.fetch(:truncate, 50)
        end
      end
    end
  end
end
