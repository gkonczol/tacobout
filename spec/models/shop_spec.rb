require 'rails_helper'

RSpec.describe Shop, type_id: :model do
  context 'New shop with no tacos' do
    subject do
      Shop.create(
        name: 'Tacoless Shop',
        address: '1234 coolio st.',
        type_id: 'truck'
      )
    end

    it 'declares itself as a truck' do
      expect(subject.type_id).to eq('truck')
    end

    it 'can add a new taco' do
      subject.add_taco(Taco.create)
      expect(subject.tacos.length).to eq(1)
    end
  end

  context 'Taco restaurant with lots of tacos' do
    beefy = Taco.create
    crunchy = Taco.create
    seafood = Taco.create
    subject do
      taco_shop = Shop.create({
        address: 'establishment ln.',
        type_id: 'restaurant'
      })
      taco_shop.tap do |ts|
        ts.tacos.push(beefy, crunchy, seafood)
      end
    end

    it 'has three tacos' do
      expect(subject.tacos.length).to eq(3)
    end

    it 'is a restaurant' do
      expect(subject.type_id).to eq('restaurant')
    end
  end
end
