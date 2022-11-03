FactoryBot.define do
  factory :order_destination do
    posta_code { '123-4567' }
    shipping_origin_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "09012345678" }
  end
end
