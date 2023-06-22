class User < ApplicationRecord
    has_many :studios
    has_many :reservations

    validates :username, presence: true, uniqueness: true
    
end
