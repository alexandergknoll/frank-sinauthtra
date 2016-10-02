get '/users/new' do
  if current_user
    redirect '/'
  else
    @user = User.new
    erb :'users/new'
  end
end

post '/users' do
  if current_user
    redirect '/'
  else
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect "/"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end
end

get '/users/:user_id/edit' do
  if current_user && current_user.id.to_s == params[:user_id].to_s
    @user = current_user
    erb :'users/edit'
  else
    redirect '/'
  end
end

post '/users/:user_id/update' do
  if current_user && current_user.id.to_s == params[:user_id].to_s
    @user = current_user
    if @user.update(params[:user])
      redirect "/"
    else
      @errors = @user.errors.full_messages
      erb :'users/edit'
    end
  else
    redirect '/'
  end
end
