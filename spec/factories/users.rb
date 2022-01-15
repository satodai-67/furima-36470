FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { 'free@gmail.com' }
    password              { 'aaaa0000' }
    password_confirmation { password }
    first_name            { '佐藤' }
    last_name             { '吾郎' }
    firstkana_name        { 'サトウ' }
    lastkana_name         { 'ゴロウ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
