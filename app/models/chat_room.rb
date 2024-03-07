class ChatRoom < ApplicationRecord
  has_many :matches
  has_many :messages

end
