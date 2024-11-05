# frozen_string_literal: true

class Organization::ProductionLine < ApplicationRecord
  STATUS = %w[active inactive].freeze
  belongs_to :area, class_name: 'Organization::Area',
             foreign_key: :organization_area_id
  has_many :assets, class_name: 'Maintenance::Asset',
           foreign_key: :organization_production_line_id

  enum :status, STATUS
end
