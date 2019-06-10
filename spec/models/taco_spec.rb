# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taco, type: :model do
  let(:cheese) {FactoryBot.build(:ingredient, :cheese)}
  let(:chicken) {FactoryBot.build(:ingredient, :chicken)}
  let(:medium_salsa) {FactoryBot.build(:ingredient, :mediumsalsa)}
  let(:hot_salsa) {FactoryBot.build(:ingredient, :hotsalsa)}

  context 'empty taco' do
    shell = Shell.create(
      primary_ingredient: 0,
      soft: false)
    shop = Shop.create
    subject = FactoryBot.build(:taco, :useless)
    subject.shell_id = shell.id
    subject.shop_id = shop.id
    subject.save

    it 'has a name' do
      expect(subject.name).to eq('Useless Taco')
    end

    it 'has a description' do
      expect(subject.description).to eq('empty like my soul')
    end

    it 'has a shell' do
      expect(subject.shell_id).not_to be_nil
    end

    it 'has a shop' do
      expect(subject.shop_id).not_to be_nil
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
    before do
      subject.ingredients.push(cheese, chicken, medium_salsa)
    end

    it 'has the correct ingredients' do
      expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa)
    end
  end

  context 'with ingredients' do

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
    shop = Shop.create
    shell = Shell.create(
      primary_ingredient: 0,
      soft: false)
    subject = Taco.new(shell_id: shell.id, shop_id: shop.id)
    before do
      subject.ingredients.push(cheese, chicken, medium_salsa, hot_salsa)
    end

    it 'has the correct ingredients' do
      expect(subject.ingredients).to contain_exactly(cheese, chicken, medium_salsa, hot_salsa)
    end
  end

  context 'rate a taco' do
    subject = Taco.create
    subject.setup

    it 'initializes to zero' do
      expect(subject.rating).to eq(0)
    end

    it 'will become 5 when rated up 5 once' do
      subject.rate(5)
      expect(subject.rating).to eq(5)
    end

    it 'will average and become 3 when second rating is 1' do
      subject.rate(1)
      expect(subject.rating).to eq(3)
    end
  end
end
