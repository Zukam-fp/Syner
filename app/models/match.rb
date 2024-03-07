class Match < ApplicationRecord
  has_many :teams
  belongs_to :chat_room
  belongs_to :user

  validates :number_of_places, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
