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
