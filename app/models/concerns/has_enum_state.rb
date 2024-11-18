# frozen_string_literal: true

# Concern that adds enum state functionality to ActiveRecord models with associated colors.
#
# @example Basic usage with default states and colors
#   class MyModel < ApplicationRecord
#     include HasEnumState
#     has_enum_state :status
#   end
#
#   # Available methods:
#   MyModel::STATUSES         # => [:inactive, :active]
#   MyModel::STATUS_COLORS    # => { active: 'green', inactive: 'red' }
#   model.status_color        # => 'green' or 'red'
#   model.status             # => 'active' or 'inactive'
#
# @example Custom states and colors
#   class MyModel < ApplicationRecord
#     include HasEnumState
#
#     CRITICALITY_LEVELS = %i[low medium high critical].freeze
#     CRITICALITY_COLORS = {
#       low: 'green',
#       medium: 'yellow',
#       high: 'orange',
#       critical: 'red'
#     }.freeze
#
#     has_enum_state :criticality_level,
#                   values: CRITICALITY_LEVELS,
#                   colors: CRITICALITY_COLORS,
#                   default: :low
#   end
#
#   # Available methods:
#   MyModel::CRITICALITY_LEVELS  # => [:low, :medium, :high, :critical]
#   MyModel::CRITICALITY_COLORS  # => { low: 'green', medium: 'yellow', ... }
#   model.criticality_level      # => 'low', 'medium', 'high', or 'critical'
#   model.criticality_level_color # => 'green', 'yellow', 'orange', or 'red'
#
# @note This concern automatically includes validation for enum values
# @note Colors are expected to be strings representing CSS color names or values
#
module HasEnumState
  extend ActiveSupport::Concern

  included do
    # @!attribute [rw] STATUSES
    #   @return [Array<Symbol>] Default available states if not overridden
    STATUSES = %i[inactive active].freeze unless const_defined?(:STATUSES)

    # @!attribute [rw] STATUS_COLORS
    #   @return [Hash{Symbol => String}] Default color mappings if not overridden
    STATUS_COLORS = {
      active: 'green',
      inactive: 'red'
    }.freeze unless const_defined?(:STATUS_COLORS)
  end

  class_methods do
    # Defines an enum attribute with associated color metadata
    #
    # @param attribute [Symbol] The name of the enum attribute
    # @param values [Array<Symbol>] Available enum values
    # @param colors [Hash{Symbol => String}, nil] Color mappings for each state
    # @param default [Symbol] Default state for new records
    #
    # @option values [Array<Symbol>] List of valid enum values
    # @option colors [Hash{Symbol => String}] Mapping of states to color values
    # @option default [Symbol] Initial state for new records (default: :active)
    #
    # @raise [ArgumentError] If colors are provided but don't match all enum values
    #
    # @example Define a simple status enum
    #   has_enum_state :status
    #
    # @example Define a custom enum with specific states and colors
    #   has_enum_state :priority,
    #                 values: %i[low medium high],
    #                 colors: { low: 'green', medium: 'yellow', high: 'red' },
    #                 default: :low
    #
    # @return [void]
    def has_enum_state(attribute, values: self::STATUSES, colors: nil, default: :active)
      # Define the enum using Rails 7+ syntax with validation
      enum attribute, values, default: default, validate: true

      # Use provided colors or fall back to default STATUS_COLORS
      color_constant = colors.presence || self::STATUS_COLORS

      # Define the color accessor method
      define_method("#{attribute}_color") do
        color_constant[send(attribute).to_sym]
      end
    end
  end
end
