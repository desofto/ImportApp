require 'rails_helper'

describe OperationsController do
  describe '#import' do
    it 'calls OperationsImporter' do
      expect(ImportWorker).to receive(:perform_async).with('test.csv')

      allow_any_instance_of(OperationsController).to receive(:uploaded_file_name) { 'test.csv' }
      post :import
    end
  end
end
