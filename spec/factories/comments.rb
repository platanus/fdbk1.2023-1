FactoryBot.define do
  factory :comment do
    feedback_session
    body { Faker::Lorem.sentence }
  end
end
