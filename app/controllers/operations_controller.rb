class OperationsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @operations = @company.operations

    filter = params[:filter]
    if filter.present?
      mask = %r{#{filter.downcase}}
      @operations = @operations.select do |o|
        pass = o.status.downcase.match mask
        pass ||= o.categories.map(&:name).join(';'.freeze).downcase.match mask
        pass ||= o.invoice_num.downcase.match mask
        pass ||= o.reporter.downcase.match mask
        pass
      end
    end

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
