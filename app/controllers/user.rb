get '/users/new' do
  if current_user
    redirect '/'
  else
    erb :'users/new'
  end
end

post '/users/new' do
  if current_user
    redirect '/'
  else
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/"
    else
      @errors = user.errors.full_messages
      erb :'users/new'
    end
  end
end

post '/users/login' do
  user = User.authenticate(params[:credentials])
  session[:user_id] = user.id if user
  redirect "/"
end

post '/users/logout' do
  user_logout
  redirect "/"
end