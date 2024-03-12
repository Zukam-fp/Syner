class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :user_teams
  has_many :messages
  has_many :matches

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
end
