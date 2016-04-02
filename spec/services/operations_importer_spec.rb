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
      expect(Operation).to receive(:create!).and_call_original

      expect(Company).to receive(:find_by).with(name: 'BP Biznes').and_call_original
      expect(Category).to receive(:find_or_create).with('negligible').and_call_original
      expect(Category).to receive(:find_or_create).with('Other').and_call_original

      subject.send(:import_row, ROW)
    end
  end
end
