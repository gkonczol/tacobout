# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taco, type: :model do
  let(:shop) { create(:shop) }
  let(:shell) { create(:shell) }

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
    let(:cheese) { Ingredient.new(name: 'cheese') }
    let(:chicken) { Ingredient.new(name: 'chicken') }
    let(:medium_salsa) { Ingredient.new(name: 'salsa', spice: 5) }

    before do
      subject.ingredients.push(cheese, chicken, medium_salsa)
    end

    it 'has the correct ingredients' do
      expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa)
    end
  end

  context 'with ingredients' do
    let(:cheese) { Ingredient.create(name: 'cheese', vegan: false) }
    let(:chicken) { Ingredient.create(name: 'chicken', vegan: false) }
    let(:medium_salsa) { Ingredient.create(name: 'salsa', spice: 5) }
    let(:hot_salsa) { Ingredient.create(name: 'Hot Salsa', spice: 10) }

    before do
      subject.ingredients.push(cheese, chicken, medium_salsa, hot_salsa)
    end

    it 'has the correct ingredients' do
      expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa, hot_salsa)
    end

    it 'is not empty' do
      expect(subject.ingredients).not_to be_empty
    end

    it 'is not vegan' do
      expect(subject.vegan?).to eq(false)
    end
  end

  context 'vegan taco' do
    let(:cheese) { Ingredient.new(name: 'cheese') }
    let(:chicken) { Ingredient.new(name: 'chicken') }
    let(:medium_salsa) { Ingredient.new(name: 'salsa', spice: 5) }
    let(:hot_salsa) { Ingredient.create(name: 'Hot Salsa', spice: 10) }
    subject(:vegan_taco) { Taco.new(shell: shell, shop: shop) }
    before do
      subject.ingredients.push(cheese, chicken, medium_salsa, hot_salsa)
    end

    it 'has the correct ingredients' do
      expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa, hot_salsa)
    end
  end
end
