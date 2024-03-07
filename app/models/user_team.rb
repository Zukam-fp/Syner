class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :ratings


  validates :user_position, presence: true
end
