# frozen_string_literal: true

puts 'Starting maintenance seed...'
Faker::Config.locale = 'es-MX'

puts 'Creating technicians...'
users = User.all
users.each do |user|
  next if user.technician.present?
  Maintenance::Technician.create!(
    user: user,
    specialty: Faker::Job.field,
    certification_level: (1..5).to_a.sample,
    status: Maintenance::Technician::STATUSES.sample
  )
end

puts 'Creating plants...'
3.times do |i|
  Organization::Plant.create!(
    code: "PL0#{i + 1}",
    name: "Planta #{Faker::Address.unique.city}",
    address: Faker::Address.full_address,
    status: Organization::Plant::STATUSES.sample
  )
end

puts 'Creating areas...'
plants = Organization::Plant.all
plants.each do |plant|
  3.times do |i|
    Organization::Area.create!(
      code: "AR0#{i + 1}",
      name: Faker::Industry.area_name,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      organization_plant_id: plant.id,
      status: Organization::Area::STATUSES.sample
    )
  end
end

puts 'Creating production lines...'
areas = Organization::Area.all
areas.each do |area|
  3.times do |i|
    Organization::ProductionLine.create!(
      code: "LI0#{i + 1}",
      name: Faker::Industry.production_line,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      organization_area_id: area.id,
      status: Organization::ProductionLine::STATUSES.sample
    )
  end
end

puts 'Creating manufacturers...'
10.times do |i|
  Maintenance::Manufacturer.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: Faker::Industry.manufacturer,
    website: Faker::Internet.url,
    support_phone: Faker::PhoneNumber.phone_number,
    suport_email: Faker::Internet.email,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    status: Maintenance::Manufacturer::STATUSES.sample
  )
end

puts 'Creating asset types...'
7.times do
  Maintenance::AssetType.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 5).upcase,
    name: Faker::Industry.asset_type,
    description: Faker::Lorem.sentence,
    status: Maintenance::AssetType::STATUSES.sample
  )
end

puts 'Creating assets...'
asset_types = Maintenance::AssetType.all
production_lines = Organization::ProductionLine.includes(area: :plant)
manufacturers = Maintenance::Manufacturer.all
35.times do
  asset_type = asset_types.sample
  Maintenance::Asset.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 3).upcase,
    name: Faker::Industry.asset_name(asset_type),
    maintenance_asset_type_id: asset_type.id,
    organization_production_line_id: production_lines.sample.id,
    maintenance_manufacturer_id: manufacturers.sample.id,
    model: Faker::Alphanumeric.alpha(number: 8).upcase,
    serial_number: Faker::Alphanumeric.unique.alpha(number: 12).upcase,
    manufacturing_date: Faker::Date.between(from: '2015-01-01', to: '2020-12-31'),
    purchase_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31'),
    warranty_expiration: Faker::Date.between(from: '2024-01-01', to: '2026-12-31'),
    status: Maintenance::Asset::STATUSES.sample,
    criticality_level: Maintenance::Asset::CRITICALITY_LEVELS.sample,
    technical_specs: { power: "#{rand(100..5000)}W", voltage: "#{rand(110..440)}V" },
    physical_location: Faker::Address.secondary_address,
    notes: Faker::Lorem.sentence
  )
end

puts 'Creating asset components, documents, and assignees...'
assets = Maintenance::Asset.all
technicians = Maintenance::Technician.all
assets.each do |asset|
  3.times do
    asset.components.create(
      name: Faker::Appliance.equipment,
      description: Faker::Lorem.sentence,
      quantity: rand(1..5),
      specifications: { power: "#{rand(100..5000)}W", voltage: "#{rand(110..440)}V" },
      replacement_period: rand(1..12),
      status: Maintenance::AssetComponent::STATUSES.sample
    )

    asset.documents.create(
      document_type: Faker::File.mime_type,
      name: Faker::File.file_name,
      description: Faker::Lorem.sentence,
      version: Faker::App.semantic_version,
      expiration_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31'),
      status: Maintenance::AssetDocument::STATUSES.sample
    )
  end

  2.times do
    asset.assignees.create(
      technician: technicians.sample
    )
  end
end

puts 'Creating maintenance tools...'
20.times do
  Maintenance::Tool.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 3).upcase,
    name: Faker::Industry.tool,
    description: Faker::Lorem.sentence,
    calibration_required: Faker::Boolean.boolean
  )
end

puts 'Creating maintenance plans...'
35.times do
  asset = assets.sample
  plan_type = Maintenance::Plan::PLAN_TYPES.sample
  translated_plan_type = Maintenance::Plan.new(plan_type: plan_type).t_enum(:plan_type)
  Maintenance::Plan.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 5).upcase,
    name: "#{Faker::Industry.plan_name_prefix} #{translated_plan_type} #{asset.name}",
    description: Faker::Lorem.sentence,
    plan_type: plan_type,
    status: Maintenance::Plan::STATUSES.sample,
    criticality: Maintenance::Plan::CRITICALITIES.sample,
    frequency_type: Maintenance::Plan::FREQUENCY_TYPES.sample,
    frequency_value: rand(1..12),
    estimated_duration: rand(30..240),
    requires_shutdown: Faker::Boolean.boolean,
    asset: asset,
    component: asset.components.sample,
    start_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31')
  )
end

puts 'Creating maintenance resources...'
plans = Maintenance::Plan.all
tools = Maintenance::Tool.all
technicians = Maintenance::Technician.all
plans.each do |plan|
  3.times do
    plan.resources.create(
      resource_type: Maintenance::PlanResource::RESOURCE_TYPES.sample,
      tool: tools.sample,
      specialty_type: Maintenance::PlanResource::SPECIALTY_TYPES.sample,
      quantity: rand(1..5),
      hours_required: rand(1..8)
    )
  end
end

puts 'Creating plan tasks...'
plans.each do |plan|
  5.times do |i|
    plan.tasks.create(
      sequence_number: i + 1,
      name: Faker::Industry.task_name,
      description: Faker::Lorem.sentence,
      estimated_duration: rand(30..240),
      requires_shutdown: Faker::Boolean.boolean
    )
  end
end

puts 'Creating task steps...'
tasks = Maintenance::PlanTask.all
tasks.each do |task|
  (2..5).to_a.sample.times do |i|
    task.steps.create(
      sequence_number: i + 1,
      description: Faker::Lorem.sentence
    )
  end
end

puts 'Creating task measurements...'
tasks.each do |task|
  (2..4).to_a.sample.times do |i|
    task.measurements.create(
      name: "Medicion de: #{Faker::Industry.measurement_type}",
      measurement_type: Faker::Industry.measurement_type,
      nominal_value: rand(1..100),
      min_value: rand(1..100),
      max_value: rand(1..100),
      tolerance_percentage: rand(1..10),
      is_critical: Faker::Boolean.boolean
    )
  end
end

puts 'Creating maintenance schedules...'
plans.each do |plan|
  3.times do
    plan.schedules.create(
      scheduled_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31'),
      status: Maintenance::Schedule::STATUSES.sample
    )
  end
end

puts 'Creating maintenance assignments...'
schedules = Maintenance::Schedule.all

puts 'Maintenance seed completed.'
