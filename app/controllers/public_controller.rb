# frozen_string_literal: true

# PublicController is a controller for static pages that are publicly accessible.
class PublicController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end

  def help; end

  def about; end

  def contact; end
end
