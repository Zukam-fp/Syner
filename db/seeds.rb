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
Rating.destroy_all
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


match_1 = Match.create!(user: user3, chat_room: ChatRoom.create!, number_of_places: 10, address: adresses.sample, date: Date.today - 1)


team_1 = Team.create!(match: match_1, name:"A")
        Team.create!(match: match_1, name:"B")
userteam = UserTeam.create!(user: user3, team: team_1, position: "goalkeeper", user_position: 0)


team_a_users = (User.all - [match_1.user]).sample(4)
team_b_users = (User.all - team_a_users - [match_1.user]).sample(5)

# Assigner les utilisateurs à l'équipe A
positions = ["defence", "defence2", "attack", "attack2"]

team_a_users.each do |user|
  position = positions.sample
  positions.delete(position)
  UserTeam.create!(user: user, team: match_1.teams.first, position: position, user_position: 0)
end

# Assigner les utilisateurs à l'équipe B
positions = ["goalkeeper2", "defence3", "defence4", "attack3", "attack4"]

team_b_users.each do |user|
  position = positions.sample
  positions.delete(position)
  UserTeam.create!(user: user, team: match_1.teams.second, position: position, user_position: 0)
end

match_1.update(number_of_places: match_1.count_players)


User.all.each_with_index do |user, index|

  # Enregistrer l'utilisateur
  chatroom = ChatRoom.create!
  # Créer un match
   match = Match.create!(user: user, chat_room: chatroom, number_of_places: 10, address: adresses[index], date: Date.today + 1.day)

  # Créer 2 équipes
   team1 = Team.create!(match: match, name: "A")
    Team.create!(match: match, name: "B")


    UserTeam.create(user: user, team: team1, position: "goalkeeper", user_position: 0)

end

puts "matches and teams created"

puts "generate faker team"
teams = Match.all.map(&:teams).flatten

puts "assign users to teams"
# Pour chaque match


Match.all[1...].each do |match|
  p match.user
  # Sélectionner 5 utilisateurs pour chaque équipe
  team_a_users = (User.all - [match.user]).sample(rand(0..3))
  team_b_users = (User.all - team_a_users - [match.user]).sample(rand(0..4))

  # Assigner les utilisateurs à l'équipe A
  positions = ["defence", "defence2", "attack", "attack2"]

  team_a_users.each do |user|
    position = positions.sample
    positions.delete(position)
    UserTeam.create(user: user, team: match.teams.first, position: position, user_position: 0)
  end

  # Assigner les utilisateurs à l'équipe B
  positions = ["goalkeeper2", "defence3", "defence4", "attack3", "attack4"]

  team_b_users.each do |user|
    position = positions.sample
    positions.delete(position)
    UserTeam.create(user: user, team: match.teams.second, position: position, user_position: 0)
  end

  match.update(number_of_places: match.count_players)
end
puts "users to teams assigned"
