# frozen_string_literal: true

module Seeds
  class Users
    def self.seed
      puts 'Seeding users...'
      9.times do |i|
        User.create!(
          email: Faker::Internet.email,
          password: '123456',
          password_confirmation: '123456',
          confirmed_at: Time.now
        )
      end

      puts 'Seeding Profiles...'
      users = User.all
      users.each do |user|
        profile = user.create_profile(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
          gender: UserProfile::GENDERS.sample
        )
        if profile.persisted?
          puts "Perfil creado exitosamente"
        else
          puts "Error creando perfil: #{profile.errors.full_messages}"
        end
      end
    end
  end
end
