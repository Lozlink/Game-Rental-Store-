def games
    run_sql('SELECT * FROM games ORDER by id')
end