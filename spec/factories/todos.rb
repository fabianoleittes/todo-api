FactoryBot.define do
  factory :todo do
    title { FFaker::Lorem.word }
    created_by { 10 }
  end

  trait :fail do
    title {}
    created_by {}
  end
end
