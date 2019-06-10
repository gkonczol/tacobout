FactoryBot.define do
  factory :ingredient do
    trait :default do
      name {'fake ingredient'}
    end

    trait :chicken do
      name {'Chicken'}
      spice {0}
      vegan {false}
    end
    
    trait :cheese do
      name {'Cheese'}
      spice {0}
      vegan {false}
		end

    trait :jalapeno do
      name {'Jalapeno'}
      spice {3}
    end
    
    trait :habanero do
      name {'Habanero'}
      spice {5}
    end
    
    trait :mediumsalsa do
      name {'Salsa'}
      spice {5}
    end
    
    trait :hotsalsa do
      name {'Hot Salsa'}
      spice {10}
		end
	end
end