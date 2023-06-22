class Studio < ApplicationRecord
    belongs_to  :user
    has_many :reservations

    validates :name, :description, :location, :working_hours, :image_url, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates :duration, numericality: { only_integer: true }
    validates :rating, numericality: { in: 1..5 }
end
