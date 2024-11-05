# frozen_string_literal: true

# Application record
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Returns the translated enum value
  # @param enum_field [Symbol]
  # @return [String]
  def translate_enum(enum_field)
    return nil unless send(enum_field)
    model_key = self.class.model_name.i18n_key
    I18n.t("activerecord.enums.#{model_key}.#{enum_field}.#{send(enum_field)}",
           default: send(enum_field).to_s.humanize)
  end

  # Alias más corto si prefieres una sintaxis más concisa
  alias_method :t_enum, :translate_enum
end
