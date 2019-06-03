FactoryBot.define do
  factory :review do
    user { nil }
    rating { nil }
    comment { "MyString" }
  end
end
