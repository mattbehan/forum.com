def current_user
  @current_user ||= User.find_by(sessions_user_id)
end

def sessions_user_id
  @sessions_user_id ||= session[:user_id]
end

def authenticated?
  session[:user_id] != nil
end

def authorized id
  sessions_user_id == id.to_i
end
