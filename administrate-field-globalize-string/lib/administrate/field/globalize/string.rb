require "administrate/field/base"
require "rails"

module Administrate
  module Field
    module Globalize
      class String < Administrate::Field::Base
        class Engine < ::Rails::Engine
        end
      end
    end
  end
end
