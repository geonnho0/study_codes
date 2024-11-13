FactoryBot.define do
  factory :feedback do
    content { "feedback content" }
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
