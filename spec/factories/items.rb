FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '説明' }
    price { 2000 }
    status_id          { 1 }
    delivery_charge_id { 1 }
    shipping_origin_id { 1 }
    shipping_day_id    { 1 }
    category_id        { 1 }
    association :user
  end
end
