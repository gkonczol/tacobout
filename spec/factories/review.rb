FactoryBot.define do
  factory :review do
    user { nil }
    rating { nil }
    comment { "Test_Comment" }
  end
end
