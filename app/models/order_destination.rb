class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
   
  end
 
  def save
   order = Order.create(user_id:user_id, item_id:item_id)
   Destination.create(post_code:post_code, shipping_origin_id:shipping_origin_id, city:city, address:address,building_name:building_name,phone_number:phone_number, order_id:order.id) 
  end
end
