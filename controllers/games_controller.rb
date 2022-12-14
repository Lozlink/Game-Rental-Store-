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
    erb :'games/new'
end



post '/games' do
    name = params['name']
    year_released = params['year_released']
    image_url = params['image_url']
    genre = params['genre']
    developer = params['developer']
    platforms = params['platforms']
    description = params['description']    

    add_game(name, year_released, image_url, genre, developer, platforms, description)

    redirect '/wishlist'

end

get '/wishlist' do

    get_last_game = get_last_game()
    erb :'/users/wishlist', locals: {
        get_last_game: get_last_game
    }
end

post '/games/:id/wishlist' do
    game_id = params['id']
    user_id = session['user_id']

    run_sql('INSERT INTO wishlist(user_id, game_id) VALUES($1, $2)', [user_id, game_id])
    redirect '/'
end

get '/games/:id/edit' do
    id = params['id']
    game = get_game(id)

    erb :'games/edit_game', locals: {
        game: game
    }
end

put '/games/:id' do
    id = params['id']
    name = params['name']
    year_released = params[year_released]
    image_url = params['image_url']
    genre = params['genre']
    developer = params['developer']
    platforms = params['platforms']
    description = params['description']   

    edit_game(name, year_released, image_url, genre, developer, platforms, description)

    redirect '/'
end

delete '/games/:id' do
    id = params['id']
    
    delete_game(id)

    redirect '/'
end

get '/game_details' do
    games = games()

    erb :'games/game_details', locals: {
        games: games
    }
end