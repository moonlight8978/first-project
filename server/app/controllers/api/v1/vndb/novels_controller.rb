class Api::V1::Vndb::NovelsController < ApplicationController
  def index
    @novels = ::Vndb::Novel.all
    render json: @novels, key_transform: :camel_lower, status: :ok,
      include: [
        'releases.developers', 'releases.publishers',
        'characters.seiyuus', 'staffs.person'
      ],
      each_serializer: Api::V1::Vndb::NovelSerializer
    # @companies = ::Vndb::Company.includes(:developeds, :publisheds).all
    # render json: @companies, key_transform: :camel_lower, status: :ok,
    #   each_serializer: Api::V1::Vndb::CompanySerializer
  end

  def show
    @novel = ::Vndb::Novel.find(params[:id])
    render json: @novel, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Novel::NovelSerializer
  end

  def characters
    @novel = ::Vndb::Novel.includes(characters: :people).find(params[:id])
    @characters = @novel.characters
    render json: @characters, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::CharacterSerializer
  end

  def staffs
    @novel = ::Vndb::Novel.includes(:people).find(params[:id])
    @staffs = @novel.staffs.group_by(&:position)
    @staff_serializers = @staffs.map do |position, staffs|
      [position.camelcase(:lower), staff_serializer(staffs)]
    end.to_h
    render json: @staff_serializers
  end

  def releases
    @novel = ::Vndb::Novel.includes(releases: [:developers, :publishers]).find(params[:id])
    @releases = @novel.releases
    render json: @releases, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::ReleaseSerializer
  end

private

  def staff_serializer(staffs)
    staffs.map do |staff|
      ActiveModelSerializers::SerializableResource.new(
        staff,
        serializer: Api::V1::Vndb::Novel::StaffSerializer,
        root: false,
        key_transform: :camel_lower
      )
    end
  end
end
