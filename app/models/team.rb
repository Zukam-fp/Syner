class Team < ApplicationRecord
  has_many :user_teams
  belongs_to :match

  validates :name, presence: true
end
