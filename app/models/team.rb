class Team < ApplicationRecord
  has_many :user_team
  validates :name, presence: true
  validates :score, presence: true
end
