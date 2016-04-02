class OperationsController < ApplicationController
  def index
    @operations = Company.find(params[:company_id]).operations

    respond_to do |format|
      format.json { render json: @operations.decorate.map(&:to_json) }
    end
  end

  def import
    id = ImportWorker.perform_async(uploaded_file_name)

    redirect_to root_path(jid: id)
  end

  private

  def uploaded_file_name
    params.require(:file).path
  end
end
