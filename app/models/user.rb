class User < ApplicationRecord
  has_many :studios, dependent: nil
  has_many :reservations, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
