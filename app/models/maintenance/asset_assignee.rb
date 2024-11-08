# frozen_string_literal: true

class Maintenance::AssetAssignee < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :asset, class_name: 'Maintenance::Asset',
             foreign_key: :maintenance_asset_id
  belongs_to :technician, class_name: 'Maintenance::Technician',
             foreign_key: :maintenance_technician_id

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------
  delegate :full_name, to: :technician
  delegate :email, to: :technician

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------
end
