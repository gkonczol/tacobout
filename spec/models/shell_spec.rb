require 'rails_helper'

RSpec.describe Shell, type: :model do
  context 'soft corn shell' do
    subject do
      Shell.create(
        primary_ingredient: 0,
        soft: true
      )
    end

    it 'has a corn shell' do
      expect(subject.primary_ingredient).to eq('corn')
    end
  end

  context 'hard flour shell' do
    subject do
      Shell.create(
        primary_ingredient: 1,
        soft: false
      )
    end

    it 'has a flour shell' do
      expect(subject.primary_ingredient).to eq('flour')
    end
  end
end
