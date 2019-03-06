FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { "todo-api" }
    password_confirmation { "todo-api" }
  end

  trait :invalid do
    email {}
    password {}
  end
end
