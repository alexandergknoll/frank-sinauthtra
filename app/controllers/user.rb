post '/login' do
  current_user = User.authenticate(params[:credentials])
  session[:current_user] = current_user.id if current_user
  redirect "/"
end

post '/logout' do
  session[:current_user] = nil
  redirect "/"
end