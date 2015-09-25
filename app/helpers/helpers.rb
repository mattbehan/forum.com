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

  def time_ago difference
    total_seconds = Time.now - difference
    days = (total_seconds/24/60/60).floor
    years = (days/365)
    total_seconds = ( years > 0 ? 0 : total_seconds)
    hours = ( ( (total_seconds/24/60/60) % 1) * 24).floor
    hours = ( ( years > 0 || hours == 0 ) ? "" : "#{hours} hours " )
    minutes = ( ( ( ( (total_seconds/24/60/60) % 1) * 24) % 1 ) * 60).floor
    minutes = ( (minutes > 0 && days == 0) ? "#{minutes} minutes " : "" )
    seconds =   ( ( ( ( ( ( (total_seconds/24/60/60) % 1) * 24) % 1 ) * 60) % 1 ) * 60).floor
    seconds = ( days > 0 ? "" : "#{seconds} seconds" )
    days = ( days > 0 ? "#{days} days " : "" )
    years = ( years > 0 ? "#{years} years " : "")
    years + days + hours + minutes + seconds
  end
