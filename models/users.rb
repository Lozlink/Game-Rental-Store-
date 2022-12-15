def create_user(first_name, last_name, email, password)
    
    password_digest = BCrypt::Password.create(password)
    run_sql("INSERT INTO users(first_name, last_name, email, password_digest) VALUES($1, $2, $3, $4)", [first_name, last_name, email, password_digest])
    
end

def find_user_by_email(email)
    users = run_sql('SELECT * FROM users WHERE email = $1', [email])

    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def find_user_by_id(id)
    run_sql('SELECT * FROM users WHERE id = $1', [id])[0]
end

def edit_user(id,first_name, last_name, email)
    run_sql('UPDATE users set first_name = $2, last_name = $3, email = $4 WHERE id = $1', [id,first_name, last_name, email])
end
