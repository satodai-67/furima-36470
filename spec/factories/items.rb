FactoryBot.define do
  factory :item do
    image {'test_image.png'}
    item_name {'test'}
    item_explanation {'testtest'}
    category_id { 2 }
    state_id { 3 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    
    end
  end
end
