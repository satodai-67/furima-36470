FactoryBot.define do
  factory :purchase_address do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipalities { 'カリフォルニア' }
    house_number   { '1-1' }
    building_name  { 'ハイツ' }
    phone_number   { '01012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
