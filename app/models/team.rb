class Team < ApplicationRecord
  belongs_to :user_team
  validates :name, presence: true
  validates :score, presence: true
end
