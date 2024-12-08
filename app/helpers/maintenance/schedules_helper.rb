# app/helpers/maintenance/schedules_helper.rb
module Maintenance
  module SchedulesHelper
    def schedule_status_badge_class(status)
      base_classes = "text-xs font-medium px-2.5 py-0.5 rounded"

      status_classes = {
        pending: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300",
        in_progress: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300",
        completed: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300",
        cancelled: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300"
      }

      "#{base_classes} #{status_classes[status.to_sym]}"
    end
  end
end
