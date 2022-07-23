class CategoriesController < ApplicationController
    before_action :get_user
    
    def index
        @categories = @user.categories.all
        @count = @categories.count
    end
    
    def new
        @category = @user.categories.build
    end

    def create
        @category = @user.categories.build(category_params)
        
        if @category.save
            redirect_to category_tasks_path(@category.id)
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @category = @user.categories.find(params[:id])
    end

    def edit
        @category = @user.categories.find(params[:id])
    end
    
    def update
        @category = @user.categories.find(params[:id])

        if @category.update(category_params)
            redirect_to category_path(@category.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = @user.categories.find(params[:id])
        @category.destroy
        redirect_to categories_path, status: :see_other
    end

    private

    def get_user
        @user = User.find(current_user.id)
    end

    def category_params
        params.require(:category).permit(:name)
    end

end