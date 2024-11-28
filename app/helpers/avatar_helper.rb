# frozen_string_literal: true

module AvatarHelper
  def user_avatar(user, options = {})
    if user.profile.avatar&.attached?
      variant = options.delete(:variant)
      avatar_image = variant ? user.profile.avatar.variant(variant) :
                       user.profile.avatar
      image_tag avatar_image, **options
    else
      initials = generate_initials(user)
      content_tag :div, class: options[:class] do
        content_tag :div, initials,
                    class: 'w-full h-full flex items-center justify-center
                            bg-blue-600 text-white text-xl font-medium
                            rounded-lg'
      end
    end
  end

  private

    def generate_initials(user)
      return user.email.first(2).upcase unless user.first_name.present? ||
        user.last_name.present?

      [ user.first_name&.first&.upcase,
        user.last_name&.first&.upcase ].compact.join('')
    end
end
