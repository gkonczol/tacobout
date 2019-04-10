describe Taco do

  before do
    @taco = Taco.new
  end

  it 'belongs to a location' do

  end

  it 'has a shell' do

  end

  it 'has a spicy level' do

  end

  context 'with ingredients' do

    context 'cheesy chicken taco' do
      let(:cheesy_chicken_taco) { @taco.stuff(cheese, chicken, salsa) }

      it 'is not empty' do

      end

      it 'is not vegetarian' do

      end
    end

    context 'cheese taco' do
      it 'is vegetarian' do

      end
    end

  end

end
