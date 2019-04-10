describe Taco do
  let(:shell) { Shell.new(:corn) }
  subject(:taco) { Taco.new(shell) }

  it 'belongs to a location' do

  end

  it 'has a shell' do

  end

  it 'has a spicy level' do

  end

  context 'with ingredients' do

    context 'cheesy chicken taco' do
      subject(:cheesy_chicken_taco) { @taco.stuff(cheese, chicken, salsa) }

      it 'has the correct ingredients' do

      end

      it 'is not empty' do

      end

      it 'is not vegetarian' do

      end
    end

    context 'cheesy taco' do
      subject(:cheesy_taco) { @taco.stuff(cheese, salsa) }

      it 'is vegetarian' do

      end
    end

  end

end
