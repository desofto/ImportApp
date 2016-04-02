require 'rails_helper'

describe Company do
  describe 'relations' do
    it { expect(subject).to have_many(:operations) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
  end
end
