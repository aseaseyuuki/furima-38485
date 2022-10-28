FactoryBot.define do
  
  factory :item do
    name               {"商品名"}
    description        {"説明"}
    price              { 2000 }
    status_id          { 2 }
    delivery_charge_id { 2 }
    shipping_origin_id { 2 }
    shipping_day_id    { 2 }
    category_id        { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/タスク着手順序.png'), filename: 'タスク着手順序.png')
    end
    association :user

  end
end
   