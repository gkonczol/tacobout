require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'rating in relation to taco shop' do
	cheesy = Taco.new
	meaty = Taco.new
	cheesy.setup
	meaty.setup
	cheesy.rate(3.5)
	meaty.rate(4.5)
	subject = Shop.create()
	subject.setup([cheesy, meaty])


    it 'a shop that has not been rated has a rating of zero, regardless of its tacos' do
      expect(subject.rating).to eq(0)
    end
    
    it 'can be rated, and the first rating entered is the rating of the shop' do
      subject.rate(5)
      expect(subject.rating).to eq(5)
    end

    it 'multiple ratings are averaged to calculate the rating of a shop with more than one rating' do
      subject.rate(1)
      expect(subject.rating).to eq(3)
    end

  end
end