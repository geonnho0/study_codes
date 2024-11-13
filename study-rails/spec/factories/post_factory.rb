FactoryBot.define do
  factory :post do
    title { "Post title" }
    association :user
  end
end
