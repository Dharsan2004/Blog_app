class CategoriesController < ApplicationController
    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(name: params[:name])
        if @category.save
          flash[:notice] = "Category was successfully created"
          redirect_to @category
        else
          render 'new',status: :unprocessable_entity 
        end
    end

    def index 
    end

end
