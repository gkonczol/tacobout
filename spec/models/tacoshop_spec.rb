require 'rails_helper'

RSpec.describe TacoShop, type: :model do
  context 'New tacoshop with no tacos' do
    subject do
      TacoShop.create(Rating.new, {
        location: '1234 boye st.',
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

  context 'Old tacoshop with lots of tacos' do

  end
end