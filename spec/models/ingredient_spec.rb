require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:chicken) {FactoryBot.build(:ingredient, :chicken)}
  let(:jalapeno) {FactoryBot.build(:ingredient, :jalapeno)}
  let(:habanero) {FactoryBot.build(:ingredient, :habanero)}
  let(:default) {FactoryBot.build(:ingredient, :default)}

  it 'has a name' do
    expect(chicken.name).to eq('Chicken')
  end

  it 'has default spice of zero' do
    expect(default.spice).to eq(0)
  end

  it 'defaults to vegan' do
    expect(default.vegan?).to eq(true)
  end

  it 'has no spice' do
    expect(chicken.spice).to eq(0)
  end

  it 'has medium spice' do
    expect(jalapeno.spice).to eq(3)
  end

  it 'has maximum spice' do
    expect(habanero.spice).to eq(5)
  end
end
