FactoryBot.define do
  factory :ingredient do
    trait :default do
      name {'fake ingredient'}
    end

    trait :chicken do
      name {'Chicken'}
      spice {0}
		end

    trait :jalapeno do
      name {'Jalapeno'}
      spice {3}
    end
    
    trait :habanero do
      name {'Habanero'}
      spice {5}
		end
	end
end