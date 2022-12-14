get '/users/new' do
    erb :'users/new_user'
end

post '/users' do
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']
    password = params['password']

    create_user(first_name, last_name, email, password)

    redirect '/sessions/new' 
end

get '/users/:id' do
    if !logged_in?
        redirect '/'
    end
    user_id = session['user_id']
    
    wishlist_games = games_on_wishlist(user_id)

    erb :'/users/account', locals: {
        wishlist_games: wishlist_games
    }   
end

put '/users/:id' do
    if !logged_in?
        redirect '/'
    end

    id = params['id']
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']

    edit_user(id, first_name, last_name, email)

    redirect '/users/:id'
end
