class Api::V1::Db::PeopleController < ApplicationController
  def index
    @people = ::Db::Person
      .includes(:staffs, :country, :voice_actresses)
      .all
  
    paginate json: @people, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Db::Person::PersonListSerializer
  end

  def show
    @person = ::Db::Person.find(params[:id])

    render json: @person, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Db::Person::PersonListSerializer
  end

  def create
    @create_svc = PersonService::CreatePerson
      .new(create_person_params)
      .perform

    unless @create_svc.errors?
      render_ok
    else
      render json: @create_svc.errors.detail, status: @create_svc.errors.status
    end
  end

  def update
    @update_svc = PersonService::UpdatePerson
      .new(params[:id], update_person_params)
      .perform

    unless @update_svc.errors?
      render_ok
    else
      render json: @update_svc.errors.detail, status: @update_svc.errors.status
    end
  end

  def destroy
    @destroy_svc = PersonService::DestroyPerson
      .new(params[:id])
      .perform

    unless @destroy_svc.errors?
      render_ok
    else
      render json: @destroy_svc.errors.detail, status: @destroy_svc.errors.status
    end
  end

private

  def create_person_params
    params.permit(

    )
  end

  def update_person_params
    params.permit(

    )
  end
end
