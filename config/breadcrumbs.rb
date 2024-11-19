# frozen_string_literal: true

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :root do
  link t('home'), root_path
end

crumb :settings_general do
  link t('settings.general.index.breadcrumb'), settings_root_path
  parent :root
end

# -- ---------------------------------------------------------------------------
# -- Maintenance Assets --------------------------------------------------------
crumb :maintenance_assets do
  link t('maintenance.assets.index.breadcrumb'), maintenance_assets_path
  parent :root
end

crumb :maintenance_asset do |asset|
  link asset.full_code, maintenance_asset_path(asset)
  parent :maintenance_assets
end

crumb :new_maintenance_asset do
  link t('breadcrumbs.new'), new_maintenance_asset_path
  parent :maintenance_assets
end

crumb :edit_maintenance_asset do |asset|
  link t('breadcrumbs.edit'), edit_maintenance_asset_path(asset)
  parent :maintenance_asset, asset
end

# -- ---------------------------------------------------------------------------
# -- Maintenance Asset Types ---------------------------------------------------
crumb :maintenance_asset_types do
  link t('maintenance.asset_types.index.breadcrumb'), maintenance_asset_types_path
  parent :settings_general
end

crumb :maintenance_asset_type do |asset_type|
  link asset_type.code, maintenance_asset_type_path(asset_type)
  parent :maintenance_asset_types
end

crumb :new_maintenance_asset_type do
  link t('breadcrumbs.new'), new_maintenance_asset_type_path
  parent :maintenance_asset_types
end

crumb :edit_maintenance_asset_type do |asset_type|
  link t('breadcrumbs.edit'), edit_maintenance_asset_type_path(asset_type)
  parent :maintenance_asset_type, asset_type
end

# -- ---------------------------------------------------------------------------
# -- Maintenance Manufacturers -------------------------------------------------
crumb :maintenance_manufacturers do
  link t('maintenance.manufacturers.index.breadcrumb'), maintenance_manufacturers_path
  parent :settings_general
end

crumb :maintenance_manufacturer do |manufacturer|
  link manufacturer.code, maintenance_manufacturer_path(manufacturer)
  parent :maintenance_manufacturers
end

crumb :new_maintenance_manufacturer do
  link t('breadcrumbs.new'), new_maintenance_manufacturer_path
  parent :maintenance_manufacturers
end

crumb :edit_maintenance_manufacturer do |manufacturer|
  link t('breadcrumbs.edit'), edit_maintenance_manufacturer_path(manufacturer)
  parent :maintenance_manufacturer, manufacturer
end

# -- ---------------------------------------------------------------------------
# -- Technicians ---------------------------------------------------------------
crumb :maintenance_technicians do
  link t('maintenance.technicians.index.breadcrumb'), maintenance_technicians_path
  parent :settings_general
end

crumb :maintenance_technician do |technician|
  link technician.full_name, maintenance_technician_path(technician)
  parent :maintenance_technicians
end

crumb :new_maintenance_technician do
  link t('breadcrumbs.new'), new_maintenance_technician_path
  parent :maintenance_technicians
end

crumb :edit_maintenance_technician do |technician|
  link t('breadcrumbs.edit'), edit_maintenance_technician_path(technician)
  parent :maintenance_technician, technician
end

# -- ---------------------------------------------------------------------------
# -- Organization Plants --------------------------------------------------------
crumb :organization_plants do
  link t('organization.plants.index.breadcrumb'), organization_plants_path
  parent :settings_general
end

crumb :organization_plant do |plant|
  link plant.code, organization_plant_path(plant)
  parent :organization_plants
end

crumb :new_organization_plant do
  link t('breadcrumbs.new'), new_organization_plant_path
  parent :organization_plants
end

crumb :edit_organization_plant do |plant|
  link t('breadcrumbs.edit'), edit_organization_plant_path(plant)
  parent :organization_plant, plant
end

# -- ---------------------------------------------------------------------------
# -- Organization Areas --------------------------------------------------------
crumb :organization_areas do
  link t('organization.areas.index.breadcrumb'), organization_areas_path
  parent :settings_general
end

crumb :organization_area do |area|
  link area.code, organization_area_path(area)
  parent :organization_areas
end

crumb :new_organization_area do
  link t('breadcrumbs.new'), new_organization_area_path
  parent :organization_areas
end

crumb :edit_organization_area do |area|
  link t('breadcrumbs.edit'), edit_organization_area_path(area)
  parent :organization_area, area
end

# -- ---------------------------------------------------------------------------
# -- Organization Production Lines ---------------------------------------------
crumb :organization_production_lines do
  link t('organization.production_lines.index.breadcrumb'), organization_production_lines_path
  parent :settings_general
end

crumb :organization_production_line do |production_line|
  link production_line.code, organization_production_line_path(production_line)
  parent :organization_production_lines
end

crumb :new_organization_production_line do
  link t('breadcrumbs.new'), new_organization_production_line_path
  parent :organization_production_lines
end

crumb :edit_organization_production_line do |production_line|
  link t('breadcrumbs.edit'), edit_organization_production_line_path(production_line)
  parent :organization_production_line, production_line
end

# -- ---------------------------------------------------------------------------
# -- Maintenance Plans ---------------------------------------------------------
crumb :maintenance_plans do
  link t('maintenance.plans.index.breadcrumb'), maintenance_plans_path
  parent :root
end

crumb :maintenance_plan do |plan|
  link plan.code, maintenance_plan_path(plan)
  parent :maintenance_plans
end

crumb :new_maintenance_plan do
  link t('breadcrumbs.new'), new_maintenance_plan_path
  parent :maintenance_plans
end

crumb :edit_maintenance_plan do |plan|
  link t('breadcrumbs.edit'), edit_maintenance_plan_path(plan)
  parent :maintenance_plan, plan
end
