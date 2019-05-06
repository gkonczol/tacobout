require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:chicken) { Ingredient.create(name: 'Chicken', spice: 0) }
  let(:jalapeno) { Ingredient.create(name: 'Jalapeno', spice: 3) }
  let(:habanero) { Ingredient.create(name: 'Habanero', spice: 5) }

  it 'has a name' do
    expect(chicken.name).to eq('Chicken')
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
