# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Seeding users"

users = []
  10.times do |i|
    users << {
      firstname: Faker::Name.unique.first_name,
      lastname: Faker::Name.last_name,
      email_address: Faker::Internet.unique.email,
      password: 's3cr3t',
      password_confirmation: 's3cr3t',
      phonenumber: Faker::PhoneNumber.cell_phone_with_country_code
    }
    end


users.each do |user|
  User.create!(
    email_address: user[:email_address],
    firstname: user[:firstname],
    lastname: user[:lastname],
    password: user[:password],
    password_confirmation: user[:password_confirmation],
    phonenumber: user[:phonenumber]
  )
end
puts "Seeded users"
