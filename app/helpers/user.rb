def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

def user_logout
  session[:user_id] = nil
end