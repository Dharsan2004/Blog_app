class ArticlesController < ApplicationController
    
  
    
    def new
        @article = Article.new 
    end

    def create 
        p "post req hit"
        
        @article = Article.new(user_params)
        
        #hardcoding whcih user creating article

        @article.user = User.first

        if @article.save 
            p "done "
            flash[:notice] = "Article created successfully"
            redirect_to articles_path
        else
            render :new,status: :unprocessable_entity 
        end


    end 

    def edit 
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
        id  = params[:id]
        @a = Article.find_by(id: id)
    end

    def destroy
        id = params[:id]
        article = Article.find_by(id: id)
        article.destroy()
        redirect_to articles_path
    end

private

    def user_params
        params.permit(:Title,:Description)
    end

end
