require_relative '../../app/models/tacoshop'

describe TacoShop do
  before do
    is_truck = false
    location = '1234 st. dr. ln.'
    rating = 'None'
    @tacoshop = TacoShop.new(is_truck, location)
  end

  it 'can instantiate' do
    @tacoshop.nil?
  end

  it 'has tacos' do
    @tacoshop.get_tacos.nil?
  end

  it 'has a location' do
    @tacoshop.get_location.nil?
  end

  it 'is a truck or not' do
    @tacoshop.is_truck.nil?
  end

  it 'has a rating' do
    @tacoshop.rating.nil?
  end

  it 'can update rating' do
    @tacoshop.rate_up(5)
    @tacoshop.rating == 5
  end
end