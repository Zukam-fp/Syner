class UserTeam < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :ratings

  validates :name, presence: true
  validates :user_position, presence: true
end
