FactoryBot.define do
  factory :order_form do
    postcode               { '123-4567' }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city                   { Gimei.city.kanji }
    block                  { '青山1-1-1' }
    building               { '柳ビル103' }
    phone_number           { '09012341234' }
    token                  { 'tok_abcdefghijk00000000000000000' }
    user_id                { 1 }
    item_id                { 2 }
  end
end
