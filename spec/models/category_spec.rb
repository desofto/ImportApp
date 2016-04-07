require 'rails_helper'

describe Category do
  describe 'relations' do
    it { expect(subject).to have_and_belong_to_many (:operations) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
  end
end
