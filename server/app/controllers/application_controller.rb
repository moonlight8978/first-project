class ApplicationController < ActionController::API
  def index
    @eroges = Eroge.all
    render json: @eroges
  end

  def create
    render plain: params.inspect
  end
end
