class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :studio

  validates :reservation_date, :location, presence: true
end
