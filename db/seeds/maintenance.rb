# frozen_string_literal: true

puts 'Starting maintenance seed...'
Faker::Config.locale = 'es-MX'

9.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: Time.now
  )
end

# Datos de prueba para la tabla plants
2.times do |i|
  Organization::Plant.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
    status: :active
  )
end

# Datos de prueba para la tabla areas
plants = Organization::Plant.all
2.times do |i|
  Organization::Area.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    organization_plant_id: plants.sample.id,
    status: :active
  )
end

# Datos de prueba para la tabla production_lines
areas = Organization::Area.all
3.times do |i|
  Organization::ProductionLine.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: "Línea de Producción #{i + 1}",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    organization_area_id: areas.sample.id,
    status: :active
  )
end

# Datos de prueba para la tabla manufacturers
10.times do |i|
  Maintenance::Manufacturer.create!(
    name: Faker::Company.unique.name,
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    website: Faker::Internet.url,
    support_phone: Faker::PhoneNumber.phone_number,
    suport_email: Faker::Internet.email,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    status: :active
  )
end

# Datos de prueba para la tabla asset_types
10.times do
  Maintenance::AssetType.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 5).upcase,
    name: Faker::Appliance.equipment,
    description: Faker::Lorem.sentence,
    status: :active
  )
end

# Datos de prueba para la tabla assets
asset_types = Maintenance::AssetType.all
production_lines = Organization::ProductionLine.includes(area: :plant)
manufacturers = Maintenance::Manufacturer.all
50.times do
  Maintenance::Asset.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 3).upcase,
    name: Faker::Appliance.equipment,
    maintenance_asset_type_id: asset_types.sample.id,
    organization_production_line_id: production_lines.sample.id,
    maintenance_manufacturer_id: manufacturers.sample.id,
    model: Faker::Alphanumeric.alpha(number: 8).upcase,
    serial_number: Faker::Alphanumeric.unique.alpha(number: 12).upcase,
    manufacturing_date: Faker::Date.between(from: '2015-01-01', to: '2020-12-31'),
    purchase_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31'),
    warranty_expiration: Faker::Date.between(from: '2024-01-01', to: '2026-12-31'),
    status: Maintenance::Asset::STATUSES.sample,
    criticality_level: Maintenance::Asset::CRITICALITY_LEVELS.sample,
    technical_specs: { power: "#{rand(100..500)}W", voltage: "#{rand(110..240)}V" },
    physical_location: Faker::Address.secondary_address,
    notes: Faker::Lorem.sentence
  )
end

puts 'Maintenance seed completed.'
