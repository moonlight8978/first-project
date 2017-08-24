class Api::V1::Db::People::VoiceActressesController < ApplicationController
  def index
    @person = ::Db::Person
      .includes({ voice_actresses: { 
                    character_novel: [
                      :character, { novel: :releases }
                    ] 
                  } 
                }, :country)
      .find(params[:person_id])
    @voice_actresses = Kaminari
      .paginate_array(@person.voice_actresses.sort_date)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)

    render json: @voice_actresses, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Person::VoiceActressSerializer
      
    response.headers['x-per-page'] = params[:per_page] || 10
    response.headers['x-page'] = params[:page] || 1
    response.headers['x-total'] = @person.voice_actresses.size
  end
end
