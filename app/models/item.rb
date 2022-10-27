class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_origin
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :status
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user

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

  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
