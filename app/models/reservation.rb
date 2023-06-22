class Reservation < ApplicationRecord
  belongs_to :studio_id
  belongs_to :user_id
end
