get '/' do
    games = games()

    erb :'games/index', locals: {
        games: games
    }
end

get '/games/new' do
    erb :'games/new'
end