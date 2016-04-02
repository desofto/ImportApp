require 'rails_helper'

describe OperationsController do
  describe '#import' do
    it 'calls OperationsImporter' do
      expect(OperationsImporter).to receive_message_chain(:new, :import)

      allow_any_instance_of(OperationsController).to receive(:uploaded_file_name) { 'test.csv' }
      post :import
    end
  end
end
