def rand_game
    run_sql('SELECT * FROM games ORDER BY RANDOM () LIMIT 3') 
end

def games
    run_sql('SELECT * FROM games ORDER BY RANDOM () LIMIT 8')
end

def add_game(name, year_released, image_url, genre, developer, platforms, description)
    run_sql('INSERT INTO games(name, year_released, image_url, genre, developer, platforms, description) VALUES($1, $2, $3, $4, $5, $6, $7)', [name, year_released, image_url, genre, developer, platforms, description])
end

def get_last_game
    run_sql('SELECT * FROM games ORDER BY id DESC LIMIT 1')
end

def get_game(id)
    run_sql('SELECT * FROM games WHERE id = $1', [id])[0]
end

def edit_game(id, name, year_released, image_url, genre, developer, platforms, description)
    run_sql('UPDATE games set name = $2, year_released = $3, image_url = $4, genre = $5, developer = $6, platforms = $7, description = $8 WHERE id = $1', [id, name, year_released, image_url, genre, developer, platforms, description])
end

def delete_game(id)
    run_sql('DELETE FROM games WHERE id = $1', [id])
end

def games_on_wishlist(user_id)
    run_sql('SELECT users.first_name, wishlist.game_id, games.id, games.name FROM ((users JOIN wishlist ON users.id = wishlist.user_id) JOIN games ON games.id = wishlist.game_id) WHERE users.id = $1', [user_id])    
end

def all_games
    run_sql('SELECT * FROM games')
end

def remove_from_wishlist(user_id, game_id)
    run_sql('DELETE from wishlist WHERE user_id = $1 AND game_id = $2', [user_id, game_id]);
end








