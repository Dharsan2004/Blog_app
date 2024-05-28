module ApplicationHelper


    def current_user
        user ||=  User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        if session[:user_id] != nil 
            return true
        else
            return false
        end
    end

end
