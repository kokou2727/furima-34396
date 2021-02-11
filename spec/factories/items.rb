FactoryBot.define do
  factory :item do
    title               { 'test' }
    description         { 'test_description' }
    price               { '1000' }
    category_id         { '2' }
    fee_id              { '2' }
    shipping_date_id    { '2' }
    from_id             { '2' }
    state_id            { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
