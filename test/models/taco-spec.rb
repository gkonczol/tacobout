# frozen_string_literal: true

describe Taco do
  let(:shop) { Shop.new('Magic Tacos', '123 Taco Street, Tacoland, OR, 97701') }
  let(:shell) { Shell.new(:corn, soft: false) }
  subject(:taco) { Taco.new(shell: shell, shop: shop) }

  it 'has a corn shell' do
    expect(taco.shell.type).to eq(:corn)
  end

  it 'has a soft shell' do
    expect(taco.shell.soft).to eq(false)
  end

  context 'with ingredients' do
    context 'cheesy chicken taco' do
      let(:cheese) { Ingredient.new('cheese') }
      let(:chicken) { Ingredient.new('chicken') }
      let(:medium_salsa) { Ingredient.new('salsa', spicy: 5) }
      subject(:cheesy_chicken_taco) { taco.stuff(cheese, chicken, medium_salsa) }

      it 'has the correct ingredients' do
        expect(taco.ingredients).to contain_exactly(cheese, chicken, medium_salsa)
      end

      it 'is not empty' do
        expect(taco.ingredients).not_to be_empty
      end

      it 'is not vegetarian' do
        expect(taco.vegetarian).to eq(false)
      end

      it 'has a spicy level' do
        expect(taco.spicy_level).to eq(5)
      end
    end

    context 'cheesy taco' do
      subject(:cheesy_taco) { taco.stuff(cheese, salsa) }

      it 'is vegetarian' do
        expect(taco.vegetarian).to eq(true)
      end
    end
  end
end
