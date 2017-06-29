class VndbService::Novel::CreateNovel
  attr_accessor :novel

  def initialize(params)
    @params = params
    if params[:characters].present?
      @characters_params = @params.extract!(:characters)[:characters]
    end
    @error = false
  end

  def perform
    @novel = Vndb::Novel.new(@params)
    @error = true unless @novel.save
    if @characters_params.present?
      @characters_params.each do |character_params|
        @novel.characters.build(character_params)
      end
    end
    @error = true unless @novel.save
  end

  def error?
    @error
  end
end 