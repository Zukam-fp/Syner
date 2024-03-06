class Rating < ApplicationRecord
  belongs_to :user_team

  validates :team_work, presence: true
  validates :physic, presence: true
  validates :dribbling, presence: true
  validates :shoot, presence: true
end
