class Message < ApplicationRecord
  belongs_to :community
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 1000}
end
