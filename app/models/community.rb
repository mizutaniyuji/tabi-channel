class Community < ApplicationRecord
    
    validates :title, presence: true, length: {maximum:100}
    validates :area, presence: true
    
    has_many :messages, dependent: :destroy
    belongs_to :user
    
end
