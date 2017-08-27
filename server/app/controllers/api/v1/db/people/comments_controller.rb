class Api::V1::Db::People::CommentsController < ApplicationController
  before_action :authenticate, except: :index
  
  def index
    @comments = ::Feature::Comment
      .includes(:user)
      .where(
        commentable_type: 'Db::Person', 
        commentable_id: params[:person_id]
      )
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
      
    render json: @comments, status: :ok, key_transform: :camel_lower,
      each_serializer: Api::V1::Feature::Comment::CommentListSerializer
      
    response.headers['x-per-page'] = params[:per_page] || 10
    response.headers['x-page'] = params[:page] || 1
    response.headers['x-total'] = @comments.total_count
  end
  
  def create
    @person = ::Db::Person.find(params[:person_id])
    @comment = @person.comments
      .create(create_comment_params.merge(user_id: curr_user.id))
      
    unless @comment.errors.any?
      render_ok
    else
      render json: ErrorMessage.new(@comment.errors).detail, 
        status: :bad_request
    end
  end
  
private

  def create_comment_params
    params.permit(:body)
  end
end
