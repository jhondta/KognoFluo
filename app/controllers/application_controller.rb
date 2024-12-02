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
  before_action :redirect_to_profile

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

    # Redirigir a la página de perfil si el usuario está loggeado y no tiene
    # un perfil.
    # No redirigir si la página que queremos acceder es la de edición de perfil
    # o si estamos cerrando sesión.
    def redirect_to_profile
      return if !user_signed_in? ||
        current_user.profile.present? ||
        (controller_path == 'users/registrations' && ['edit', 'update'].include?(action_name)) ||
        (controller_path == 'users/sessions' && action_name == 'destroy')

      flash[:error] = t('application.error.no_profile')
      redirect_to edit_user_registration_path
    end
end
