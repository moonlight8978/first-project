class VndbService::Novel::GetProducers
  def initialize(novel, type)
    @novel = novel
    @type = type
  end

  def perform
    if @type == 'publishers'
      @companies = @novel.releases.map(&:publishers).flatten.uniq(&:id)
    elsif @type == 'developers'
      @companies = @novel.releases
    end
  end

  def results
    @companies
  end
end