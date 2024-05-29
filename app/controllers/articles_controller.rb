class ArticlesController < ApplicationController
    
 
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def new
        @article = Article.new 
    end

    def create 
        p "post req hit"
        
        @article = Article.new(user_params)
        
        #hardcoding whcih user creating article

        @article.user_id = session[:user_id]
 
        if @article.save 
            p "done "
            flash[:notice] = "Article created successfully"
            redirect_to articles_path
        else
            render :new,status: :unprocessable_entity 
        end


    end 

    def edit 
        p "edit pages"
        id = params[:id]
        @article = Article.find_by(id: id)
    end

    def update 
        p "updated"
        id = params[:id]
        @article = Article.find_by(id)
        @article.Title = params[:article][:Title]
    @article.Description = params[:article][:Description]

        if @article.save 
            redirect_to article_path(@article)
        else
            render "edit",status: :unprocessable_entity 
        end

    end


    def index 
        @articles = Article.page(params[:page]).per(3) 
       
    end


    def show 
        p "its in show"
        id  = params[:id]
        @a = Article.find_by(id: id)
    end

    def destroy
        p "geloo"
        id = params[:id]
        article = Article.find_by(id: id)
        article.destroy()
        redirect_to articles_path
    end

private

    def user_params
        params.permit(:Title,:Description)
    end

    def require_user
        p "helo inside require user "
        if session[:user_id] == nil 
            p "vada punda"
            flash[:notice] = "You must me logged IN"
            redirect_to login_path
        else
            p "everyting ok !!!!!!"
        end
    end
 

    def require_same_user
        @a = Article.find_by(id: params[:id])
        p "hi da"
        if session[:user_id] != @a.user.id 
            p "wrong user id not same"
            flash[:notice]= "you can only edit or delete your own article"
            redirect_to article_path(@a)
        end
        
    end
      

   
      
      
end
