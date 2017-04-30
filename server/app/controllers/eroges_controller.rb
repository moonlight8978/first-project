class ErogesController < ApplicationController
  def index
    @eroges = Eroge.all
    render json: @eroges
  end

  def create
    @eroge = Eroge.new(eroge_params)
    if @eroge.save
      puts 'OK'
    else
      puts 'Error'
    end
  end

  private
    def eroge_params
      params.require(:eroge).permit(:title, :original_title)
    end
end
