# frozen_string_literal: true

module ModalHelper
  # @param resource [Object] The resource to be deleted
  # @param options [Hash] The options to be passed to the modal
  #
  def confirmation_modal_button(resource, options = {})
    button_tag(type: 'button',
               data: { modal_target: "confirmation-modal-#{resource.id}",
                       modal_toggle: "confirmation-modal-#{resource.id}" },
               class: options[:class]) do
      yield if block_given?
    end
  end

  # @param resource [Object] The resource to be deleted
  # @param options [Hash] The options to be passed to the modal
  #
  def render_confirmation_modal(resource, options = {})
    render partial: 'shared/confirmation_modal', locals: {
      resource: resource,
      path: options[:path],
      method: options[:method] || :delete,
      message: options[:message] || t('shared.confirmation_modal.message'),
      confirm_button_text: options[:confirm_button_text] ||
        t('shared.confirmation_modal.confirm_button_text'),
      cancel_button_text: options[:cancel_button_text] ||
        t('shared.confirmation_modal.cancel_button_text')
    }
  end
end
