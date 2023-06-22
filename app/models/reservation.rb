class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :studio

    validates :date, :location, presence: true
end
