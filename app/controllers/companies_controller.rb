class CompaniesController < ApplicationController
  def index
    @companies = Company.all.decorate.map(&:hash_with_stats)
  end
end
