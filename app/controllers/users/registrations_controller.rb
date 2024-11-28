# frozen_string_literal: true

module Users
  # Controller for handling user registrations
  class RegistrationsController < Devise::RegistrationsController
    # -- -----------------------------------------------------------------------
    # -- Constants -------------------------------------------------------------
    PERMITTED_PARAMS = [
      profile_attributes: %i[ id first_name last_name birth_date gender
                              biography avatar ]
    ]

    # -- -----------------------------------------------------------------------
    # -- Concerns --------------------------------------------------------------

    # -- -----------------------------------------------------------------------
    # -- Extensions ------------------------------------------------------------

    # -- -----------------------------------------------------------------------
    # -- Callbacks ------------------------------------------------
    # before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: %i[ update ]
    before_action :prepare_profile_form, only: %i[ edit ]

    # -- -----------------------------------------------------------------------
    # -- Helper methods --------------------------------------------------------

    # -- -----------------------------------------------------------------------
    # -- Actions ---------------------------------------------------------------

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    def edit
      super
    end

    # PUT /resource
    def update
      super
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # -- -----------------------------------------------------------------------
    # -- Protected Methods -----------------------------------------------------

    protected

    def update_resource(resource, params)
      # Removemos current_password de los parámetros si no hay cambios sensibles
      if password_or_email_change?(params)
        resource.update_with_password(params)
      else
        # Eliminamos parámetros relacionados con la contraseña
        params.delete(:current_password)
        params.delete(:password)
        params.delete(:password_confirmation)
        resource.update(params)
      end
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: PERMITTED_PARAMS)
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    def after_update_path_for(resource)
      edit_user_registration_path
    end

    def prepare_profile_form
      resource.build_profile if resource.profile.nil?
    end

    # -- -----------------------------------------------------------------------
    # -- Private Methods -------------------------------------------------------

    private

      def password_or_email_change?(params)
        params[:password].present? ||
          params[:password_confirmation].present? ||
          params[:email] != resource.email
      end
  end
end
