FactoryBot.define do
  factory :user do
    nickname                     {Faker::Name.last_name}
    email                        {Faker::Internet.free_email}
    password                     { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation        {password}
    last_name                    {"阿あア"}
    first_name                   {"阿あア阿"}
    last_name_kana               {"アアア"}
    first_name_kana              {"アアアア"}
    birthday                     {Faker::Date.birthday}
  end
end