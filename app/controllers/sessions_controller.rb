class SessionsController < ApplicationController
    def new 
    end

    def create 
        email = params[:email]
        password = params[:password]
        user = User.find_by(email: email)

        if user && user.authenticate(password)
            session[:user_id] = user.id
            flash.now[:notice] = "Logged is Successfully"
            redirect_to user_path(user)
        else
            flash.now[:notice] = "Password is Wrong"
            render :new,status: :unprocessable_entity 
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end
end
