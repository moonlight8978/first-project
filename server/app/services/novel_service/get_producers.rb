class NovelService::GetProducers
  def initialize(novel)
    @novel = novel
  end

  def perform(type, options = {})
    @companies = @novel.releases.map(&type).flatten.uniq(&:id)
    if options[:serialize] == true
      @companies = @companies.map do |company|
        ActiveModelSerializers::SerializableResource.new(
          company,
          serializer: Api::V1::Vndb::Novel::CompanySerializer,
          root: false,
          key_transform: :camel_lower
        )
      end
    end
    self
  end

  def result
    @companies
  end
end
