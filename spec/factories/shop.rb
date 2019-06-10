FactoryBot.define do
  factory :shop do
    trait :default do
      name {'Fake Shop'}
      address {'Fake Address'}
    end

    trait :tacoless do
      name {'Tacoless Shop'}
      address {'1234 coolio st.'}
      type_id {'truck'}
    end

    trait :manytacos do
      name {'Shop of Many Tacos'}
      address {'establishment ln.'}
      type_id {'restaurant'}
    end
  end
end