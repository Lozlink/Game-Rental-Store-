def rand_game
    run_sql('SELECT * FROM games ORDER BY RANDOM () LIMIT 1') 
end

def games
    run_sql('SELECT * FROM games LIMIT 3')
end

def add_game(name, year_released)
    run_sql('INSERT INTO games(name, year_released) VALUES($1, $2)', [name, year_released])
end

def get_last_game
    run_sql('SELECT * FROM games ORDER BY id DESC LIMIT 1')
end

def get_game(id)
    run_sql('SELECT * FROM games WHERE id = $1', [id])[0]
end

def edit_game(id, name, year_released)
    run_sql('UPDATE games set name = $2, year_released = $3 WHERE id = $1', [id, name, year_released])
end

def delete_game(id)
    run_sql('DELETE FROM games WHERE id = $1', [id])
end
# def games_on_wishlist
#     run_sql(SELECT users.first_name, wishlist.game_id, games.name FROM ((users JOIN wishlist ON users.id = wishlist.user_id) JOIN games ON games.id = wishlist.game_id) WHERE session[:id] = user['id']);       
# end





