get '/sessions/new' do
  if current_user
    redirect '/'
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  if current_user
    redirect '/'
  else
    user = User.authenticate(params[:credentials])
    if user
      session[:user_id] = user.id
      redirect "/"
    else
      @errors = ["Invalid email/password"]
      erb :'sessions/new'
    end
  end
end

post '/sessions/delete' do
  user_logout
  redirect "/"
end
