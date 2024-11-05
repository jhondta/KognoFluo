# frozen_string_literal: true

class Maintenance::Technician < ApplicationRecord
  belongs_to :user
end
