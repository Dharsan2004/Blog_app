class ApplicationController < ActionController::Base
    def require_user
        if session[:user_id] == nil 
            flash[:notice] = "You must me logged IN"
            redirect_to login_path

        end
    end

 

end
