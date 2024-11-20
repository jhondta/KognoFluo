# frozen_string_literal: true

module SharedUser
  def shared_user
    @shared_user ||= create(:user)
  end
end
