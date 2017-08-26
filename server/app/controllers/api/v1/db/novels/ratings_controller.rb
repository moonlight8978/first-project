class Api::V1::Db::Novels::RatingsController < ApplicationController
  before_action :authenticate, only: [:create, :show]

  def index
    @novel = ::Db::Novel.find(params[:novel_id])

  end

  def show
    @user = curr_user
    @novel = ::Db::Novel.find(params[:novel_id])
    @rating = @novel.ratings.find_by(user_id: @user.id)

    if @rating
      render json: @rating, status: :ok, key_transform: :camel_lower,
        serializer: Api::V1::Db::Novel::RatingSerializer
    else
      head :ok
    end
  end

  def create
    @user = curr_user
    @novel = ::Db::Novel.find(params[:novel_id])
    @rating = @novel.ratings.includes(:rateable, :user).find_by(user_id: @user.id)
    @errors = ErrorMessage.new
    
    if params[:star]
      if @rating
        @rating.assign_attributes(update_rating_params)
        p @rating
        if @rating.changed?
          @rating.save || @errors.add!(@rating.errors)
        else
          @errors.add!(nothing_changed: 'Nothing changed!')
        end
      else
        @rating = @novel.ratings.build(create_rating_params)
        @rating.user = @user
        @rating.save || @errors.add!(@rating.errors)
      end
    else
      if @rating
        @rating.destroy
        @rating = nil
      else
        @rating = 1
        @errors.add!(not_exist: 'You have not given score yet!')
      end
    end

    if @rating
      unless @errors.any?
        render json: @rating, status: :ok, key_transform: :camel_lower,
          serializer: Api::V1::Db::Novel::RatingSerializer
      else
        render json: @errors.detail, status: :bad_request
      end
    else
      head :ok
    end
  end

private

  def create_rating_params
    params.permit(:star)
  end

  def update_rating_params
    params.permit(:star)
  end
end
