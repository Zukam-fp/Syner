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

puts "cleaning database"
# Nettoyer la base de données
User.destroy_all
Team.destroy_all
Match.destroy_all
UserTeam.destroy_all

puts "generate user"
# Générer des données pour la table User
User.create!(first_name: "ShadowS", last_name: "Dilombre", address: "rue de l'ombre", email: "dilombre@gmail.com", password: "lombre")
User.create!(first_name: "Zukam", last_name: "Zylla", address: "rue du Z", email: "zukam@gmail.com", password: "zukamm")
User.create!(first_name: "Marius", last_name: "le M", address: "rue du M", email: "marius@gmail.com", password: "mariuss")
User.create!(first_name: "Oscar", last_name: "Oscaro", address: "rue du O", email: "oscar@gmail.com", password: "oscarr")
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

puts "generate faker team"
teams = []
10.times do
  teams << Team.create!(
    name: Faker::Sports::Football.team,
    score: 0
  )
end
puts "faker team created"

puts "generate user_team"
# Générer des données pour la table UserTeam
position = ["goalkeeper", "defender", "middlefielder", "attacker"]
User.all.each do |user|
  UserTeam.create!(team: teams.sample, user_id: user.id, user_position: position.sample)
end
puts "user_team created"

# puts "generate matches and teams"
# # Pour chaque utilisateur
# User.all.each do |user|
#   # Créer un match
#   match = Match.create(user: user)

#   # Créer 2 équipes
#   2.times do
#     Team.create(match: match)
#   end
# end
# puts "matches and teams created"

# puts "assign users to teams"
# # Pour chaque match
# Match.all.each do |match|
#   # Sélectionner 5 utilisateurs pour chaque équipe
#   team_a_users = User.all.sample(5)
#   team_b_users = (User.all - team_a_users).sample(5)

#   # Assigner les utilisateurs à l'équipe A
#   team_a_users.each do |user|
#     UserTeam.create(user: user, team: match.teams.first)
#   end

#   # Assigner les utilisateurs à l'équipe B
#   team_b_users.each do |user|
#     UserTeam.create(user: user, team: match.teams.second)
#   end
# end
# puts "users to teams assigned"
