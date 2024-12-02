# frozen_string_literal: true

module Maintenance::PlansHelper
  def format_duration(minutes)
    return '-' if minutes.blank?

    hours = minutes / 60
    minutes = minutes % 60

    case
    when hours > 0 && minutes > 0
      "#{hours}h #{minutes}m"
    when hours > 0
      "#{hours}h"
    else
      "#{minutes}m"
    end
  end
end
