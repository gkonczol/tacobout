class Rating
  attr_accessor :rating, :num_ratings

  def initialize
    @rating = nil
    @num_ratings = 0
  end

  def rate_up(added_rating)
    rating ||= 0 # if rating is still nil, set it to 0
    num_ratings ||= 0
    if added_rating > 5 or added_rating < 1
      throw new Exception('Can\'t rate with values below 1 and above 5')
    end
    num_ratings += 1
    rating += added_rating # add averaging function when not lazy
  end

  def get_rating
    rating
  end

  def get_num_ratings
    num_ratings
  end
end