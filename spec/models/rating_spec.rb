require_relative '../../app/models/rating'

describe Rating do
  before do
    @rating = Rating.new
  end

  it 'can instantiate' do
    @rating.nil?
  end

  it 'defaults to nil before first rating' do
    @rating.get_rating.nil?
  end

  it 'has zero ratings to start' do
    @rating.get_num_ratings == 0
  end

  it 'can update rating' do
    @rating.rate_up(5)
    @rating.get_rating == 5
    @rating.get_num_ratings == 1
  end
end