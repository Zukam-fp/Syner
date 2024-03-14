class Match < ApplicationRecord
  has_many :teams
  has_many :user_teams, through: :teams
  belongs_to :chat_room
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :number_of_places, presence: true
  validates :address, presence: true
  validates :date, presence: true

  POSITIONS = ["goalkeeper", "defender", "attack"]


  TEAMS = ['Team A', 'Team B']

  ADDRESSES = [

    { name: "Soccer Sal", address: "100 Av. Willy Brandt, Lille" },
    { name: "Foot play", address: "2 Av. des Saules, 59160 Lille" },
    { name: "Shoot them all", address: "40 Rue de Béthune, 59800 Lille" },
    { name: "Chaos arena", address: "jean baptiste lebas, Lille" },
    { name: "Velocity kick stadium", address: "rue de paris, Lille" },
    { name: "Infinity futsal coliseum", address: "rue des postes, Lille" }
  ]

  def count_players
    user_teams.count
  end
end
