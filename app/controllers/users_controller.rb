# get '/users' do
#
#   erb :'users/index'
# end

get '/users/new' do
  @user = User.new

  # render the new view
  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  if user.valid?
    #success
    session[:user_id] = user.id
    redirect "/subs"
  else
    #failure message
    status 422
    @errors = ["Sorry, but that email has already been taken."]
    erb :'users/new'
  end
end

# LOGOUT
delete '/logout' do
  session.delete(:user_id)
  redirect '/subs'
end
