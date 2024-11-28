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
  # -- Concerns ----------------------------------------------------------------
  include HasEnumState

  # -- -------------------------------------------------------------------------
  # -- Attributes --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Enums -------------------------------------------------------------------
  has_enum_state :status, values: STATUSES, colors: STATUS_COLORS,
                 default: :active
  has_enum_state :criticality_level, values: CRITICALITY_LEVELS,
                 colors: CRITICALITY_COLORS, default: :low

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
  # -- Validations -------------------------------------------------------------
  validates :code, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  accepts_nested_attributes_for :components, allow_destroy: true,
                                reject_if: :all_blank
  accepts_nested_attributes_for :documents, allow_destroy: true,
                                reject_if: :all_blank
  accepts_nested_attributes_for :assignees, allow_destroy: true,
                                reject_if: :all_blank

  # -- -------------------------------------------------------------------------
  # -- Scopes ------------------------------------------------------------------
  default_scope { order(created_at: :desc) }

  # -- -------------------------------------------------------------------------
  # -- Delegations -------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Class Methods -----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Instance Methods --------------------------------------------------------

  # @return [String] the full code of the asset
  #
  def full_code
    line = production_line
    area = line.area
    plant = area.plant
    "#{plant.code}-#{area.code}-#{line.code}-#{code}"
  end

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------
end
