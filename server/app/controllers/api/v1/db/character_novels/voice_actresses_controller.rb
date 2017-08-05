class Api::V1::Db::CharacterNovels::VoiceActressesController < ApplicationController
  def index

  end

  def create
    create_svc = CharacterService::CreateVoiceActress
      .new(params[:character_novel_id], params[:person_id], create_va_params)

    create_svc.perform

    if create_svc.person_not_found?
      render json: create_svc.errors, status: :not_found
    elsif create_svc.errors?
      render json: create_svc.errors, status: :bad_request
    else
      render json: create_svc.result, key_transform: :camel_lower, status: :ok,
        serializer: Api::V1::Db::Novel::Character::VoiceActressSerializer
    end
  end

  def update
    update_svc = CharacterService::UpdateVoiceActress
      .new(params[:id],
           update_va_params,
           no_alias: params[:no_alias])
      .perform

    if update_svc.errors?
      render json: update_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  def destroy
    @va = ::Db::Novel::Character::VoiceActress.find(params[:id])

    begin
      @va.destroy!
    rescue ActiveRecord::RecordNotDestroyed => invalid
      render json: ErrorMessage.new(invalid.record.errors), status: :bad_request
    end
  end

private

  def create_va_params
    params.permit(:alias, :alias_en)
  end

  def update_va_params
    params.permit(:alias, :alias_en)
  end
end
