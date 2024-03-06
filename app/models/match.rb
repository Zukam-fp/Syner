class Match < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
  has_many :teams

  validates :number_of_places, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
