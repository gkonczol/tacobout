# require 'rails_helper'

# RSpec.describe Rating, type: :model do
#   context 'rating in relation to taco' do
#     subject do
#       Taco.create
#     end

#     it 'initializes to nil' do
#       expect(subject.rating).to eq(nil)
#     end

#     it 'will become 5 when rated up 5 once' do
#       subject.rate(5)
#       expect(subject.rating).to eq(5)
#     end

#     it 'will average and become 3 when second rating is 1' do
#       subject.rate(1)
#       expect(subject.rating).to eq(3)
#     end
#   end

#   context 'rating in relation to taco shop' do
#     subject do
#       cheesy = Taco.new(Rating.new(3.5))
#       meaty = Taco.new(Rating.new(4.5))
#       TacoShop.create({cheesy: cheesy, meaty: meaty})
#     end
    
#     it 'instantiates when given tacos with ratings' do
#       expect(subject.rating).to !eq(nil)
#     end

#     it 'averages ratings if multiple tacos' do
#       expect(subject.rating).to eq(4) # (3.5 + 4.5) / 2
#     end
    
#     it 'assigns same rating as taco if shop has only one taco' do
#       subject.remove_taco(:meaty)
#       expect(subject.rating).to eq(3.5)
#     end
#   end
# end