class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :user_teams
  has_many :messages
  has_many :matches
  has_many :ratings, through: :user_teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  def team_work
    if ratings.any?
      return ratings.map(&:team_work).sum.to_f / ratings.size
    else
      return 0
    end
  end

  def shoot
    if ratings.any?
    return ratings.map(&:shoot).sum.to_f / ratings.size
    else
      return 0
    end
  end

  def physic
    if ratings.any?
     return ratings.map(&:physic).sum.to_f / ratings.size
    else
      return 0
    end
  end

  def dribbling
    if ratings.any?
     return ratings.map(&:dribbling).sum.to_f / ratings.size
    else
      return 0
    end
  end
end
