class Match < ApplicationRecord
  has_many :teams
  belongs_to :chat_room
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :number_of_places, presence: true
  validates :address, presence: true
  validates :date, presence: true

  ADDRESSES = [{
    name: "Le Balloon", address: "100 Av. Willy Brandt, Lille",
    name: "", address: "2 Av. des Saules, 59160 Lille",
    address: " 40 Rue de Béthune, 59800 Lille",
    address: "jean baptiste lebas, Lille",
    address: "rue de paris, Lille",
    address: "rue nationale, Lille",
    address: "rue gambetta, Lille",
    address: "rue des postes, Lille",
    address: "Rue Pierre Mauroy,Lille",
    address: "82 Rue du Molinel, 59000 Lille";
  }]
end
