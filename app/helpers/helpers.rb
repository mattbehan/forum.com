def current_user
  @current_user ||= User.find_by(sessions_user_id)
end

def sessions_user_id
  @sessions_user_id ||= session[:user_id]
end
