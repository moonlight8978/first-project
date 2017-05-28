class Vndb::CompaniesController < ApplicationController
  before_action :set_vndb_company, only: [:show, :update, :destroy]

  # GET /vndb/companies
  def index
    @vndb_companies = Vndb::Company.all

    render json: @vndb_companies
  end

  # GET /vndb/companies/1
  def show
    render json: @vndb_company
  end

  # POST /vndb/companies
  def create
    @vndb_company = Vndb::Company.new(vndb_company_params)

    if @vndb_company.save
      render json: @vndb_company, status: :created, location: @vndb_company
    else
      render json: @vndb_company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vndb/companies/1
  def update
    if @vndb_company.update(vndb_company_params)
      render json: @vndb_company
    else
      render json: @vndb_company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vndb/companies/1
  def destroy
    @vndb_company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vndb_company
      @vndb_company = Vndb::Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vndb_company_params
      params.fetch(:vndb_company, {})
    end
end
