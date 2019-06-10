require 'rails_helper'

RSpec.describe Shop, type_id: :model do
  context 'New shop with no tacos' do
    subject = FactoryBot.build(:shop, :tacoless)
    subject.setup

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
      taco_shop = FactoryBot.build(:shop, :manytacos)
      taco_shop.setup
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

  context 'rate a taco shop' do
    cheesy = Taco.new
    meaty = Taco.new
    cheesy.setup
    meaty.setup
    cheesy.rate(3.5)
    meaty.rate(4.5)
    subject = FactoryBot.build(:shop, :default)
    subject.setup([cheesy, meaty])
  
  
      it 'a shop that has not been rated has a rating of zero, regardless of its tacos' do
        expect(subject.rating).to eq(0)
      end
      
      it 'shop can be rated, and the first rating entered is the rating of the shop' do
        subject.rate(5)
        expect(subject.rating).to eq(5)
      end
  
      it 'shop with multiple ratings has ratings averaged to calculate the rating of a shop with more than one rating' do
        subject.rate(1)
        expect(subject.rating).to eq(3)
      end
  end
end
