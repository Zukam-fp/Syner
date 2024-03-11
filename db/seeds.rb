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
require "open-uri"

puts "cleaning database"
# Nettoyer la base de données
UserTeam.destroy_all
Team.destroy_all
Match.destroy_all
ChatRoom.destroy_all
User.destroy_all

file = URI.open("https://avatars.githubusercontent.com/u/156045406?v=4")
file2 = URI.open("https://avatars.githubusercontent.com/u/156658892?v=4")
file3 = URI.open("https://avatars.githubusercontent.com/u/156658468?v=4")
file4 = URI.open("https://avatars.githubusercontent.com/u/143911990?v=4")
puts "generate user"
# Générer des données pour la table User
user = User.create!(first_name: "ShadowS", last_name: "Dilombre", address: "rue de l'ombre", email: "dilombre@gmail.com", password: "lombre")
user.photo.attach(io: file, filename: "le_s", content_type: "image/jpg")
user.save
user2 = User.create!(first_name: "Zukam", last_name: "Zylla", address: "rue du Z", email: "zukam@gmail.com", password: "zukamm")
user2.photo.attach(io: file2, filename: "le_z", content_type: "image/jpg")
user2.save
user3 = User.create!(first_name: "Marius", last_name: "le M", address: "rue du M", email: "marius@gmail.com", password: "mariuss")
user3.photo.attach(io: file3, filename: "c'est_moi", content_type: "image/jpg")
user3.save
user4 = User.create!(first_name: "Oscar", last_name: "Oscaro", address: "rue du O", email: "oscar@gmail.com", password: "oscarr")
user4.photo.attach(io: file4, filename: "oscram", content_type: "image/jpg")
user4.save
puts "user created"

puts "generate faker user"
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: "password"
  )
end
puts "faker user created"

puts "generate matches and teams"

adresses = ["100 Av. Willy Brandt, Lille", "2 Av. des Saules, 59160 Lille", " 40 Rue de Béthune, 59800 Lille", "jean baptiste lebas, Lille", "rue de paris, Lille", "rue nationale, Lille", "rue gambetta, Lille", "rue des postes, Lille", "Rue Pierre Mauroy,Lille", "82 Rue du Molinel, 59000 Lille","17 Rue du Molinel, 59000 Lille","16 Rue du Molinel, 59000 Lille","15 Rue du Molinel, 59000 Lille","14 Rue du Molinel, 59000 Lille","13 Rue du Molinel, 59000 Lille","12 Rue du Molinel, 59000 Lille"]
# Pour chaque utilisateur
User.all.each_with_index do |user, index|
  p user
  # Enregistrer l'utilisateur
  chatroom = ChatRoom.create!
  # Créer un match
  p match = Match.create!(user: user, chat_room: chatroom, number_of_places: 10, address: adresses[index], date: Date.today + 1.day)
  p user
  # Créer 2 équipes
    Team.create!(match: match, name: "A")
    Team.create!(match: match, name: "B")
end
puts "matches and teams created"

puts "generate faker team"
teams = Match.all.map(&:teams).flatten
puts "faker team created"

puts "generate user_team"
# Générer des données pour la table UserTeam
position = ["goalkeeper", "defender", "middlefielder", "attacker"]
User.all.each do |user|
  team = teams.sample
  p team
  UserTeam.create!(team: teams.sample, user_id: user.id, user_position: position.sample)
end
puts "user_team created"

puts "assign users to teams"
# Pour chaque match
Match.all.each do |match|
  # Sélectionner 5 utilisateurs pour chaque équipe
  team_a_users = User.all.sample(5)
  team_b_users = (User.all - team_a_users).sample(5)

  # Assigner les utilisateurs à l'équipe A
  team_a_users.each do |user|
    UserTeam.create(user: user, team: match.teams.first)
  end

  # Assigner les utilisateurs à l'équipe B
  team_b_users.each do |user|
    UserTeam.create(user: user, team: match.teams.second)
  end
end
puts "users to teams assigned"
