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

    it 'defaults to vegan' do
      expect(subject.vegan?).to eq(true)
    end
  end

  context 'with mixed ingredients' do
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

      it 'is not vegan' do
        expect(subject.vegan?).to eq(false)
      end

      it 'has a spicy level' do
        expect(subject.spicy_level).to eq(5)
      end
    end

    context 'vegan taco' do
      let(:ingredients) { %i[medium_salsa onion radish potato tofu] }
      subject(:vegan_taco) { Taco.new(shell: shell, shop: shop, ingredients: ingredients) }

      it 'has the correct ingredients' do
        expect(subject.ingredients).to contain_exactly(medium_Salsa, onion, radish, potato, tofu)
      end

      it 'is vegan' do
        expect(taco.vegan?).to eq(true)
      end
    end
  end
end
