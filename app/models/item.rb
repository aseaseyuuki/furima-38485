class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_one :order
  


  validates :name, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :description,            presence: true
  validates :status_id,              presence: true
  validates :delivery_charge_id,     presence: true
  validates :shipping_origin_id,     presence: true
  validates :shipping_day_id,        presence: true
  validates :category_id,            presence: true
  validates :image,                  presence: true

  with_options numericality: { other_than: 1 } do
  validates :status_id
  validates :delivery_charge_id
  validates :shipping_origin_id
  validates :shipping_day_id
  validates :category_id
end
validates :price, numericality: true
end