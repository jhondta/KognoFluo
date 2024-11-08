# frozen_string_literal: true

class Common::Country < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :common_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :official_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code_alpha2, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :code_alpha3, presence: true, uniqueness: true, length: { maximum: 3 }
  validates :phone_code, presence: true, allow_blank: true, length: { maximum: 10 }
  validates :tld, presence: true, allow_blank: true, length: { maximum: 5 }
  validates :flag_svg, presence: true, allow_blank: true
  validates :flag_png, presence: true, allow_blank: true

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end