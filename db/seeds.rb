# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'cleaning database'
Flat.destroy_all

puts 'creating flats'

5.times do
  Flat.create!(
    name: Faker::JapaneseMedia::CowboyBebop.episode,
    address: Faker::Fantasy::Tolkien.location,
    description: Faker::Movies::VForVendetta.quote,
    price_per_night: "#{rand(40..200)}€",
    number_of_guests: "#{rand(1..9)} people"
  )
end

puts 'done'
puts "#{Flat.count} flats created"
