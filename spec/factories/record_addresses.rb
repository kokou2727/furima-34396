FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '18012345678' }
    user_id { 1 }
    item_id { 2 }
  end
end
