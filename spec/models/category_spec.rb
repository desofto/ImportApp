require 'rails_helper'

describe Category do
  describe 'relations' do
    it { expect(subject).to have_and_belong_to_many (:operations) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
  end

  describe '.find_or_create' do
    it 'returns existen category if present' do
      category = create(:category, name: 'client')

      expect(Category.find_or_create('client')).to eq category
    end

    it 'creates a new category if not found' do
      category = create(:category, name: 'client')

      expect(Category.find_or_create('Other')).not_to be_nil
    end
  end
end
