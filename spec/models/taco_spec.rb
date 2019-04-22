# frozen_string_literal: true

describe Taco do
  let(:shop) { Shop.new('Magic Tacos', '123 Taco Street, Tacoland, OR, 97701') }
  let(:shell) { Shell.new(:corn, soft: false) }

  context 'empty taco' do
    subject(:taco) { Taco.new(shell: shell, shop: shop) }

    it 'has a corn shell' do
      expect(subject.shell.type).to eq(:corn)
    end

    it 'has a soft shell' do
      expect(subject.shell.soft).to eq(false)
    end

    it 'has no ingredients' do
      expect(subject.ingredients).to be_empty
    end
  end

  context 'with ingredients' do
    let(:cheese) { Ingredient.new('cheese') }
    let(:chicken) { Ingredient.new('chicken') }
    let(:medium_salsa) { Ingredient.new('salsa', spicy: 5) }

    context 'cheesy chicken taco' do
      let(:ingredients) { %i[cheese chicken medium_salsa] }
      subject(:cheesy_chicken_taco) { Taco.new(shell: shell, shop: shop, ingredients: ingredients) }

      it 'has the correct ingredients' do
        expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa)
      end

      it 'is not empty' do
        expect(subject.ingredients).not_to be_empty
      end

      it 'is not vegetarian' do
        expect(subject.vegetarian).to eq(false)
      end

      it 'has a spicy level' do
        expect(subject.spicy_level).to eq(5)
      end
    end

    context 'cheesy taco' do
      let(:ingredients) { %i[cheese medium_salsa] }
      subject(:cheesy_taco) { Taco.new(shell: shell, shop: shop, ingredients: ingredients) }

      it 'is vegetarian' do
        expect(taco.vegetarian).to eq(true)
      end
    end
  end
end
