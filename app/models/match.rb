class Match < ApplicationRecord
  has_many :teams
  belongs_to :chat_room
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :number_of_places, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
