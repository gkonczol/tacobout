# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taco, type: :model do
  # let(:shop) { Shop.new('Magic Tacos', '123 Taco Street, Tacoland, OR, 97701') }
  # let(:shell) { Shell.new(:corn, soft: false) }
  let(:shop) do
    Shop.create(
      name: 'Magic Tacos',
      address: '123 Taco Street, Tacoland, OR, 97701'
    )
  end
  let(:shell) do
    Shell.create(
      primary_ingredient: 0,
      soft: false
    )
  end

  context 'empty taco' do
    let(:taco_name) { 'Useless Taco' }
    let(:taco_description) { 'empty like my soul' }
    subject(:taco) do
      Taco.create(
        name: taco_name,
        description: taco_description,
        shell: shell,
        shop: shop
      )
    end

    it 'has a name' do
      expect(subject.name).to eq(taco_name)
    end

    it 'has a description' do
      expect(subject.description).to eq(taco_description)
    end

    it 'has a shell' do
      expect(subject.shell).not_to be_nil
    end

    it 'has a shop' do
      expect(subject.shop).not_to be_nil
    end

    it 'has a corn shell' do
      expect(subject.shell.primary_ingredient).to eq('corn')
    end

    it 'has a soft shell' do
      expect(subject.shell[:soft]).to eq(false)
    end

    it 'has no ingredients' do
      expect(subject.ingredients).to be_empty
    end
  end

  context 'with ingredients' do
    let(:cheese) { Ingredient.create('cheese') }
    let(:chicken) { Ingredient.create('chicken') }
    let(:medium_salsa) { Ingredient.create('salsa', spicy: 5) }
    let(:hot_salsa) { Ingredient.create('Hot Salsa', spicy: 10) }

    context 'cheesy chicken taco' do
      let(:ingredients) { %i[cheese chicken medium_salsa hot_salsa] }
      subject(:cheesy_chicken_taco) { Taco.create(shell: shell, shop: shop, ingredients: ingredients) }

      it 'has the correct ingredients' do
        expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa, hot_salsa)
      end

      it 'is not empty' do
        expect(subject.ingredients).not_to be_empty
      end

      it 'has an averaged spicy level' do
        expect(subject.spicy_level).to eq(7.5)
      end

      # it 'is not vegetarian' do
      #   expect(subject.vegetarian).to eq(false)
      # end
    end

    context 'cheesy taco' do
      let(:ingredients) { %i[cheese medium_salsa] }
      subject(:cheesy_taco) { Taco.create(shell: shell, shop: shop, ingredients: ingredients) }

      it 'has a medium spice with one spicy ingredient' do
        expect(subject.spicy_level).to eq(5)
      end

      # it 'is vegetarian' do
      #   expect(taco.vegetarian).to eq(true)
      # end
    end
  end
end
