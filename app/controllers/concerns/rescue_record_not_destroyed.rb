# frozen_string_literal: true

# Handles ActiveRecord::RecordNotDestroyed exceptions in controllers by providing
# standardized error responses for both HTML and JSON formats.
#
# @example
#   class ApplicationController < ActionController::Base
#     include RescueRecordNotDestroyed
#   end
#
# @example Usage in a controller action
#   def destroy
#     @post.destroy!  # Will be rescued if destroy fails
#   end
#
# @note HTML requests will be redirected back (or to root) with a flash error
# @note JSON requests will receive a 422 status with error messages
#
# @see https://api.rubyonrails.org/classes/ActiveRecord/RecordNotDestroyed.html
# @see https://api.rubyonrails.org/classes/ActionController/Redirecting.html#method-i-redirect_back_or_to
#
module RescueRecordNotDestroyed
  extend ActiveSupport::Concern

  included do
    # Rescues from ActiveRecord::RecordNotDestroyed exceptions and handles the response
    # based on the request format.
    #
    # @param exception [ActiveRecord::RecordNotDestroyed] the caught exception
    # @return [void]
    #
    # @example HTML response
    #   # Redirects back or to root_path with flash error
    #   redirect_back_or_to root_path, 
    #                       error: "Cannot delete post: Has dependent comments",
    #                       status: :see_other
    #
    # @example JSON response
    #   # Returns a JSON error response with 422 status
    #   # => { "errors": ["Cannot delete post: Has dependent comments"] }
    #
    rescue_from ActiveRecord::RecordNotDestroyed do |exception|
      respond_to do |format|
        format.html do
          redirect_back_or_to(
            root_path,
            error: exception.record.errors.full_messages.join(', '),
            status: :see_other
          )
        end

        format.json do
          render json: { errors: exception.record.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end
end
