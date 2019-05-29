require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:chicken) { Ingredient.create(name: 'Chicken', spice: 0) }
  let(:jalapeno) { Ingredient.create(name: 'Jalapeno', spice: 3) }
  let(:habanero) { Ingredient.create(name: 'Habanero', spice: 5) }
  let(:default) { Ingredient.create(name: 'fake boye') }

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
