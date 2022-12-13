get '/' do
    games = games()

    erb :'games/index', locals: {
        games: games
    }
end

get '/games/new' do
    erb :'games/new'
end



post '/games' do
    name = params['name']
    year_released = params['year_released']
    
    add_game(name, year_released)

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