get '/' do
  @current_user = User.find(session[:current_user]) if session[:current_user]
  erb :index
end