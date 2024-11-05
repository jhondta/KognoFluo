# frozen_string_literal: true

class Organization::Plant < ApplicationRecord
  has_many :areas
end
