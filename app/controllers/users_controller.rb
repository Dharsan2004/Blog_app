class UsersController < ApplicationController
    
    def index
        @users= User.all 

    end
    
    def new 
        @user = User.new 
        p "asdheo"
    end

    def create 
        p "user is getting created"
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Blog app #{@user.name} you have Signed Up "
            redirect_to articles_path
        else
            render :new,status: :unprocessable_entity 
        end

    end

    def edit 
        @user  = User.find_by(id: params[:id])
    end

    def update 
        p "user is updating"
        
        @user = User.find_by(id: params[:id])
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        if @user.save
            flash.now[:notice] = "User is Edited #{@user.name}"
            p "Hello tae"
            redirect_to articles_path
        else
            p "eroro "
            render :edit,status: :unprocessable_entity 
        end
    end

    def show
        @user  = User.find(params[:id])
        @articles = @user.articles
    end


private

    def user_params
        params.permit(:name,:email,:password)
    end

end
