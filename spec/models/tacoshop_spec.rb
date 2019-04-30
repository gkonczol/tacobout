require 'rails_helper'

RSpec.describe TacoShop, type: :model do
  context 'New tacoshop with no tacos' do
    subject do
      TacoShop.create({
        location: '1234 coolio st.',
        type: 'truck'
      })
    end

    it 'has no tacos' do
      expect(subject.tacos).to eq(nil)
    end

    it 'declares itself as a truck' do
      expect(subject.type).to eq('truck')
    end

    it 'can add a new taco' do
      subject.add_taco(Taco.create(Rating.new), 'maximum ultra-beef')
      expect(subject.tacos.length).to eq(1)
      expect(subject.tacos[0].name).to be('maximum ultra-beef')
    end
  end

  context 'Taco restaurant with lots of tacos' do
    subject do
      beefy = Taco.new(Rating.new(4.5))
      crunchy = Taco.new(Rating.new(4.4))
      seafood = Taco.new(Rating.new(4.1))
      TacoShop.create({
        location: 'establishment ln.',
        type: 'restaurant',
        tacos: {
          beefy: beefy,
          crunchy: crunchy,
          seafood: seafood
        }
      })
    end

    it 'has three tacos' do
      expect(subject.tacos.length).to eq(3)
    end

    it 'is a restaurant' do
      expect(subject.type).to eq('restaurant')
    end

    it 'can remove a taco and have rating change' do
      subject.remove_taco(:seafood)
      expect(subject.tacos.length).to eq(2)
      expect(subject.rating).to eq(4.45)
    end
  end
end