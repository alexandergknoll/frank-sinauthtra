get '/users/new' do
  if current_user
    redirect '/'
  else
    erb :'users/new'
  end
end

post '/users' do
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
