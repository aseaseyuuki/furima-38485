class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_origin
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :status
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one :order
  


  
  with_options presence: true do
  validates :name
  validates :description               
  validates :image
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end 

  with_options presence: true, numericality: { other_than: 1 } do
  validates :status_id
  validates :delivery_charge_id
  validates :shipping_origin_id
  validates :shipping_day_id
  validates :category_id
  end
end