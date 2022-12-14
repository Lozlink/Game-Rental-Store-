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

# get '/users/:id' do
#     user_id = session['user_id']
    
    
#     run_sql('SELECT users.first_name, wishlist.game_id, games.name FROM ((users JOIN wishlist ON users.id = wishlist.user_id) JOIN games ON games.id = wishlist.game_id) WHERE VALUES($1) = user[id]' [user_id])      
#     erb :'/users/account'
# end


