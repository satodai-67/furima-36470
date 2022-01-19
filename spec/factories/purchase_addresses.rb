FactoryBot.define do
  factory :purchase_address do
    postal_code    {'123-4567'}
    prefecture_id  { 2 }
    municipalities {'三好市'}
    house_number   {'1-1'}
    building_name  {'ハイツ'}
    phone_number   {'01012345678'}
  end
end
