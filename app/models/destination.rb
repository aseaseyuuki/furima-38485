class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :shipping_origin
  #validates :post_code,          presence: true
  #validates :shipping_origin_id, presence: true
  #validates :city,               presence: true
  #validates :address,            presence: true
  #validates :building_name,      presence: true
  #validates :phone_number,       presence: true
end
