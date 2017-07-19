module UpdateService
private

  def nothing_changed
    errors.add!(message_from_server: '何も変わらないです。もう一度お試し下さい！')
    errors.set_status(:bad_request)
  end
end
