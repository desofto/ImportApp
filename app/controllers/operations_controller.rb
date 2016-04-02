require 'csv'

class OperationsController < ApplicationController
  def index
  end

  def import
    ::OperationsImporter.new(uploaded_file_name).import

    redirect_to root_path
  end

  private

  def uploaded_file_name
    params.require(:file).path
  end
end
