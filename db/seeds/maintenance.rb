# frozen_string_literal: true

puts 'Starting maintenance seed...'
Faker::Config.locale = 'es-MX'

9.times do |i|
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: Time.now
  )
end

puts 'Creating profiles...'
users = User.all
users.each do |user|
  next if user.profile.present?
  user.create_profile(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: UserProfile::GENDERS.sample
  )
end

puts 'Creating technicians...'
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
      name: Faker::Commerce.department,
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
      name: "Línea de #{Faker::Company.unique.industry}",
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
    name: Faker::Company.unique.name,
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
    name: Faker::Appliance.equipment,
    description: Faker::Lorem.sentence,
    status: Maintenance::AssetType::STATUSES.sample
  )
end

puts 'Creating assets...'
asset_types = Maintenance::AssetType.all
production_lines = Organization::ProductionLine.includes(area: :plant)
manufacturers = Maintenance::Manufacturer.all
35.times do
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

puts 'Maintenance seed completed.'
