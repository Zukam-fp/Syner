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

p "generate user"
# Générer des données pour la table User
User.create!(first_name: "ShadowS", last_name: "Dilombre", address: "rue de l'ombre", email: "dilombre@gmail.com", password: "lombre")
User.create!(first_name: "Zukam", last_name: "Zylla", address: "rue du Z", email: "zukam@gmail.com", password: "zukamm")
User.create!(first_name: "Marius", last_name: "le M", address: "rue du M", email: "marius@gmail.com", password: "mariuss")
User.create!(first_name: "Oscar", last_name: "Oscaro", address: "rue du O", email: "oscar@gmail.com", password: "oscarr")
p"user created"

p"generate faker user"
50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: "password"
  )
end
puts "faker user created"
