FactoryBot.define do
  factory :taco do
    trait :default do
      name {'fake taco'}
      description {'fake description'}
      shell_id {nil}
      shop_id {nil}
    end

    trait :useless do
      name {'Useless Taco'}
      description {'empty like my soul'}
      shell_id {nil}
      shop_id {nil}
    end
  end
end
