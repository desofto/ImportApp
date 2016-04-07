require 'rails_helper'

ROW = {
  'company' => 'BP Biznes',
  'invoice_num' => 'B3963',
  'invoice_date' => '2014-10-19',
  'operation_date' => '2014-10-11',
  'amount' => '10862.48',
  'reporter' => 'Miss Zola Hyatt',
  'notes' => "Assumenda nobis sint nihil consectetur praesentium.\n"\
             "Unde molestiae repellat animi assumenda.",
  'status' => 'rejected',
  'kind' => 'negligible;Other'
}

describe OperationsImporter do
  subject { OperationsImporter.new(nil) }

  describe 'import_row' do
    it 'creates operation' do
      company = create(:company, name: 'BP Biznes')
      category_negligible = create(:category, name: 'negligible')
      category_other = create(:category, name: 'Other')

      hash = {
        company: company,
        invoice_num: 'B3963',
        invoice_date: Date.parse('2014-10-19'),
        operation_date: Date.parse('2014-10-11'),
        amount: '10862.48',
        reporter: 'Miss Zola Hyatt',
        notes: "Assumenda nobis sint nihil consectetur praesentium.\nUnde molestiae repellat animi assumenda.",
        status: 'rejected',
        categories: [category_negligible, category_other]
      }

      expect(Operation).to receive(:create!).with(hash).and_call_original

      expect(Company).to receive(:find_by).with(name: 'BP Biznes') { company }
      expect(Category).to receive(:find_or_create_by).with(name: 'negligible') { category_negligible }
      expect(Category).to receive(:find_or_create_by).with(name: 'Other') { category_other }

      subject.send(:import_row, ROW)
    end
  end
end
