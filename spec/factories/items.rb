FactoryBot.define do
  factory :item do
    name                            { Faker::Game.platform }
    text                            { Faker::Lorem.sentence }
    category_id                     { Faker::Number.between(from: 2, to: 11) }
    item_condition_id               { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id             { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id                { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id                 { Faker::Number.between(from: 2, to: 4) }
    price                           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/7634-300x225.jpg'), filename: '7634-300x225.jpg')
    end
  end
end
