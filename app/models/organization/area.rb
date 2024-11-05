# frozen_string_literal: true

class Organization::Area < ApplicationRecord
  belongs_to :plant, class_name: 'Organization::Plant', inverse_of: :areas
  has_many :production_lines
end
