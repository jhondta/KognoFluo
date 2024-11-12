# frozen_string_literal: true

class Maintenance::Asset < ApplicationRecord
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  STATUSES = %i[ inactive active maintenance retired ].freeze
  STATUS_COLORS = { active: 'green', inactive: 'red', maintenance: 'yellow',
                    retired: 'gray' }.freeze
  CRITICALITY_LEVELS = %i[ low medium high critical ].freeze
  CRITICALITY_COLORS = { low: 'green', medium: 'yellow', high: 'orange',
                         critical: 'red' }.freeze

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  enum :status, STATUSES, validate: true, default: :active
  enum :criticality_level, CRITICALITY_LEVELS, validate: true, default: :low

  # -- -------------------------------------------------------------------------
  # -- Associations ------------------------------------------------------------
  belongs_to :type, class_name: 'Maintenance::AssetType',
             foreign_key: :maintenance_asset_type_id
  belongs_to :production_line, class_name: 'Organization::ProductionLine',
             foreign_key: :organization_production_line_id
  belongs_to :manufacturer, class_name: 'Maintenance::Manufacturer',
             foreign_key: :maintenance_manufacturer_id

  has_many :assignees, class_name: 'Maintenance::AssetAssignee',
           foreign_key: :maintenance_asset_id, dependent: :restrict_with_error
  has_many :components, class_name: 'Maintenance::AssetComponent',
           foreign_key: :maintenance_asset_id, dependent: :restrict_with_error
  has_many :documents, class_name: 'Maintenance::AssetDocument',
           foreign_key: :maintenance_asset_id, dependent: :restrict_with_error
  has_many :plans, class_name: 'Maintenance::Plan',
           foreign_key: :maintenance_asset_id, dependent: :restrict_with_error

  has_one :area, through: :production_line
  has_one :plant, through: :area

  has_rich_text :notes

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------
  default_scope { order(:code) }

  # -- -------------------------------------------------------------------------
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :status, presence: true, inclusion: { in: STATUSES.map(&:to_s) }
  validates :criticality_level, presence: true,
            inclusion: { in: CRITICALITY_LEVELS.map(&:to_s) }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Methods -----------------------------------------------------------------

  # Returns the status color
  # @return [String]
  #
  def status_color
    STATUS_COLORS[status.to_sym]
  end

  # Returns the criticality color
  # @return [String]
  #
  def criticality_color
    CRITICALITY_COLORS[criticality_level]
  end

  def full_code
    line = production_line
    area = line.area
    plant = area.plant
    "#{plant.code}-#{area.code}-#{line.code}-#{code}"
  end
end
