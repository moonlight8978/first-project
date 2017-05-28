class Vndb::PeopleController < ApplicationController
  before_action :set_vndb_person, only: [:show, :update, :destroy]

  # GET /vndb/people
  def index
    @vndb_people = Vndb::Person.all

    render json: @vndb_people
  end

  # GET /vndb/people/1
  def show
    render json: @vndb_person
  end

  # POST /vndb/people
  def create
    @vndb_person = Vndb::Person.new(vndb_person_params)

    if @vndb_person.save
      render json: @vndb_person, status: :created, location: @vndb_person
    else
      render json: @vndb_person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vndb/people/1
  def update
    if @vndb_person.update(vndb_person_params)
      render json: @vndb_person
    else
      render json: @vndb_person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vndb/people/1
  def destroy
    @vndb_person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vndb_person
      @vndb_person = Vndb::Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vndb_person_params
      params.fetch(:vndb_person, {})
    end
end
