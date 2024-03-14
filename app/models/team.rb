class Team < ApplicationRecord
  has_many :user_teams
  belongs_to :match
  has_many :users, through: :user_teams
  validates :name, presence: true
end
