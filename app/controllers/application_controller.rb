# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------
  include HttpAcceptLanguage::AutoLocale
  include Pagy::Backend
  include RescueRecordNotDestroyed

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # Only allow modern browsers supporting webp images, web push, badges,
  # import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern if Rails.env.production?

  # Add flash types for success and error messages.
  add_flash_types :success, :error

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  before_action :authenticate_user!

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Protected Methods -------------------------------------------------------

  protected

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private
end
