# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :country_currencies
  has_many :country_timezones
  has_many :country_languages

  has_many :currencies, through: :country_currencies
  has_many :timezones, through: :country_timezones
  has_many :languages, through: :country_languages

  validates :common_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :official_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :iso_code2, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :iso_code3, presence: true, uniqueness: true, length: { maximum: 3 }
  validates :phone_code, presence: true, allow_blank: true, length: { maximum: 10 }
  validates :tld, presence: true, allow_blank: true, length: { maximum: 5 }
  validates :flag_svg, presence: true, allow_blank: true
  validates :flag_png, presence: true, allow_blank: true
end
