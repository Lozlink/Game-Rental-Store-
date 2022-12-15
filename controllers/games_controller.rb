get '/' do
    if !logged_in? 
        rand_games = rand_game()

        erb :'games/index', locals: {
           rand_games: rand_games
        }
    else
        games = games()
        erb :'games/index', locals: {
            games: games
        }
    end
end

get '/games/new' do
    if !logged_in?
        redirect '/'
    end

    erb :'games/new'
end


post '/games' do
    if !logged_in?
        redirect '/'
    end

    name = params['name']
    year_released = params['year_released']
    image_url = params['image_url']
    genre = params['genre']
    developer = params['developer']
    platforms = params['platforms']
    description = params['description']    

    add_game(name, year_released, image_url, genre, developer, platforms, description)
    if logged_in?
    redirect '/wishlist'
    else 
    redirect '/'
    end
end

get '/wishlist' do
    if !logged_in?
        redirect '/'
    end

    get_last_game = get_last_game()
    erb :'/users/wishlist', locals: {
        get_last_game: get_last_game
    }
end

post '/games/:id/wishlist' do
    if !logged_in?
        redirect '/'
    end

    game_id = params['id']
    user_id = session['user_id']

    
    run_sql('INSERT INTO wishlist(user_id, game_id) VALUES($1, $2)', [user_id, game_id])
    redirect '/'
end


get '/games/:id/edit' do
    if !logged_in?
        redirect '/'
    end

    id = params['id']
    game = get_game(id)

    erb :'games/edit_game', locals: {
        game: game
    }
end

put '/games/:id' do
    if !logged_in?
        redirect '/'
    end

    id = params['id']
    name = params['name']
    year_released = params[year_released]
    image_url = params['image_url']
    genre = params['genre']
    developer = params['developer']
    platforms = params['platforms']
    description = params['description']   

    edit_game(id, name, year_released, image_url, genre, developer, platforms, description)

    redirect '/'
end

delete '/games/:id' do
    if !logged_in?
        redirect '/'
    end

    id = params['id']
    
    delete_game(id)

    redirect '/'
end

get '/games/:id/game_details' do
    if !logged_in?
        redirect '/'
    end

    id = params['id']
    games = get_game(id)

    erb :'games/game_details', locals: {
        games: games
    }
end

get '/games/all' do
    
    if !logged_in?
        redirect '/'
    end

    games = all_games()

    erb :'games/all', locals: {
        games: games
    }
end


post '/games/:id/delete_from_wishlist' do
    if !logged_in?
        redirect '/'
    end

    game_id = params['id']
    user_id = session['user_id']

    remove_from_wishlist(user_id, game_id)

    redirect '/users/:id'
end