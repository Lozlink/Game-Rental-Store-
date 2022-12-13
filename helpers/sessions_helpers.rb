def logged in? 
    if session['user_id']
        return true
    else
        return false
    end
end

def current_user
    if logged?
        find_user_by_id(session['user_id'])
    else
        nil
    end
end