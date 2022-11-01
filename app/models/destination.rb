class Destination < ApplicationRecord
  belongs_to :order
  #validates :post_code,          presence: true
  #validates :shipping_origin_id, presence: true
  #validates :city,               presence: true
  #validates :address,            presence: true
  #validates :building_name,      presence: true
  #validates :phone_number,       presence: true
end
