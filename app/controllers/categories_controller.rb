class CategoriesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @categories = Category.all
        # @tasks_today = Task.where(deadline: Date.current.beginning_of_day..Date.current.end_of_day)
    end
    
    def new
        # @tasks_today = Task.where(deadline: Date.current.beginning_of_day..Date.current.end_of_day)
        @categories = Category.all
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        
        if @category.save
            redirect_to @category
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @category = Category.find(params[:id])
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params["id"])
        @category.destroy
        redirect_to categories_path, status: :see_other
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end