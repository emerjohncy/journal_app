class CategoriesController < ApplicationController
    before_action :get_category, only: [:show, :edit, :update, :destroy]
    before_action :restrict_access, only: [:show, :edit, :update, :destroy]
    
    def index
        @categories = current_user.categories.all
        @count = @categories.count
    end
    
    def new
        @category = current_user.categories.build
    end

    def create
        @category = current_user.categories.build(category_params)
        
        if @category.save
            redirect_to category_tasks_path(@category.id)
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
    
    end

    def edit
    
    end
    
    def update
        if @category.update(category_params)
            redirect_to category_path(@category.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path, status: :see_other
    end

    private

    def get_category
        @category = Category.find(params[:id])
    end

    def restrict_access
        if current_user != @category.user
            redirect_to root_path
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end

end