FactoryBot.define do
  factory :user do
    full_name Faker::Name.name_with_middle
    email Faker::Internet.email
    avatar Faker::Avatar.image("slug", "60x60")
    password "default"
  end
end
