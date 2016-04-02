class CompaniesController < ApplicationController
  def index
    @companies = Company.all.decorate.map(&:hash_with_stats)
    @jid = params[:jid]
  end

  def stats
    id = params[:jid]
    container = SidekiqStatus::Container.load(id)

    respond_to do |format|
      format.json do
        render json: container.payload
      end
    end
  end
end
