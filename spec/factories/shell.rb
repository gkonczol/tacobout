FactoryBot.define do
  factory :shell do
    trait :softcorn do
      primary_ingredient {0}
      soft {true}
    end

    trait :hardflour do
      primary_ingredient {1}
      soft {false}
    end
  end
end
