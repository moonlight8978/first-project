class Security::RegisterController < ApplicationController
  def register
    @register_svc = RegisterService::Register.new(register_params)
    if @register_svc.user_already_exist?
      head :conflict
    else
      render_unauthorized and return unless @register_svc.perform
      RegisterMailer.complete_register(@register_svc.user, @register_svc.token)
        .deliver_later
      head :ok
    end
  end

  def register_confirm
    @confirm_register_svc = RegisterService::Confirm.new(confirm_token)
    if @confirm_register_svc.perform
      head :ok
    else
      render_unauthorized
    end
  end

  def test
    # @search = Vndb::Novel.search do
    #   fulltext NetworkKanjiFilter.to_hiragana('きセキ')
    # end
    # @novels = @search.results
    # render json: @novels, status: :ok
    @user = Security::User.find(1)
    @role = Security::Role.find(1)
    @user.roles << @role
  end

private

  def register_params
    params.permit(:user_name, :email, :password)
  end

  def confirm_token
    params.permit(:token)[:token]
  end
end
