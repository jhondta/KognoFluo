# frozen_string_literal: true

module HasEnumState
  extend ActiveSupport::Concern

  included do
    # Default states and colors if not defined in the model
    unless const_defined?(:STATUSES)
      STATUSES = %i[inactive active].freeze
    end

    unless const_defined?(:STATUS_COLORS)
      STATUS_COLORS = { active: 'green', inactive: 'red' }.freeze
    end
  end

  class_methods do
    # Defines the enum state with its associated metadata
    # @param attribute [Symbol] the enum attribute (e.g., :state, :criticality_level)
    # @param values [Array<Symbol>] the enum values (e.g., %i[low medium high critical])
    # @param colors [Hash] mapping of values to colors. If not provided, uses active/inactive
    # @param default [Symbol] default value for the enum
    #
    def has_enum_state(attribute, values:, colors: nil, default: :active)
      # Defines the enum method using new Rails 7 syntax
      enum attribute, values, default: default, validate: true

      # Defines the color method
      color_constant = colors.present? ? colors : self::STATUS_COLORS

      define_method("#{attribute}_color") do
        color_constant[send(attribute).to_sym]
      end
    end
  end
end
