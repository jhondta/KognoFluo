# frozen_string_literal: true

# Application helper
module ApplicationHelper
  include Pagy::Frontend

  # Returns the full title on a per-page basis
  # @param page_title [String]
  # @return [String]
  #
  def full_title(page_title = '')
    base_title = 'KognoFluo'
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  # Returns the color for the alert
  # @param type [String]
  # @return [String]
  #
  def alert_color(type)
    colors = { 'notice' => 'blue',
               'success' => 'green',
               'warning' => 'yellow',
               'alert' => 'orange',
               'error' => 'red' }
    colors[type] || 'blue'
  end

  # Returns the enum options for select
  # Example: enum_options_for_select(User, :role)
  # => [["Admin", "admin"], ["User", "user"]]
  # @param class_name [Class]
  # @param enum [Symbol]
  # @return [Array]
  #
  def enum_options_for_select(class_name, enum)
    class_name.send(enum.to_s.pluralize).map do |key, _value|
      model_key = class_name.model_name.i18n_key
      [ I18n.t("activerecord.enums.#{model_key}.#{enum}.#{key}"), key ]
    end
  end

  # Returns the formatted date
  # @param date [Date]
  # @return [String]
  def format_date(date)
    date.present? ? l(date) : '-'
  end
end
