require 'rails_helper'

RSpec.describe Shell, type: :model do
  context 'soft corn shell' do
    subject = FactoryBot.build(:shell, :softcorn)

    it 'has a corn shell' do
      expect(subject.primary_ingredient).to eq('corn')
    end
  end

  context 'hard flour shell' do
    subject = FactoryBot.build(:shell, :hardflour)

    it 'has a flour shell' do
      expect(subject.primary_ingredient).to eq('flour')
    end
  end
end
