require 'rails_helper'

describe Operation do
  describe 'relations' do
    it { expect(subject).to belong_to(:company) }
    it { expect(subject).to have_and_belong_to_many (:categories) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:invoice_num) }
    it { expect(subject).to validate_presence_of(:invoice_date) }
    it { expect(subject).to validate_presence_of(:amount) }
    it { expect(subject).to validate_presence_of(:operation_date) }
    it { expect(subject).to validate_presence_of(:status) }
    it { expect(subject).to validate_numericality_of(:amount).is_greater_than(0) }
    it { expect(create(subject.class)).to validate_uniqueness_of(:invoice_num) }
  end
end
