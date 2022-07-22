class TasksController < ApplicationController
    before_action :get_category, only: [:index, :new, :create, :show, :edit, :update, :destroy]

    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)

        if @task.save
            redirect_to category_tasks_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @task = @category.tasks.find(params[:id])
    end
    
    def edit
        @task = @category.tasks.find(params[:id])
    end
    
    def update
        @task = @category.tasks.find(params[:id])

        if @task.update(task_params)
            redirect_to category_task_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = @category.tasks.find(params["id"])
        @task.destroy
        redirect_to category_tasks_path, status: :see_other
    end

    def today
        @user = User.find(current_user.id)
        @tasks = Task.where(category_id: @user.categories, deadline: Date.current.beginning_of_day..Date.current.end_of_day)
        @count = @tasks.count
    end
    
    def overdue
        @user = User.find(current_user.id)
        @tasks = Task.where(category_id: @user.categories, deadline: Date.parse("01/01/2022")...Date.current.beginning_of_day)
        @count = @tasks.count
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :deadline)
    end
end