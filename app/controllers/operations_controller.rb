class OperationsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @operations = @company.operations.includes(:categories)

    filter = params[:filter]
    @operations = @operations.search(filter) if filter.present?

    respond_to do |format|
      format.json { render json: @operations.decorate.map(&:to_json) }
      format.csv do
        @filename = "#{@company.name}.csv"
        @output_encoding = 'UTF-8'
      end
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
