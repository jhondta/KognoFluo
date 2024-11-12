# frozen_string_literal: true

# This concern is used to rescue from ActiveRecord::RecordNotDestroyed exception
module RescueRecordNotDestroyed
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotDestroyed do |exception|
      respond_to do |format|
        format.html do
          redirect_back_or_to(root_path,
                              error: exception.record.errors.full_messages.join(', '),
                              status: :see_other)
        end
        format.json do
          render json: { errors: exception.record.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end
end
