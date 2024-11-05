# frozen_string_literal: true

class Organization::ProductionLine < ApplicationRecord
  belongs_to :area, class_name: 'Organization::Area', inverse_of: :production_lines  
end
