require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in(users(:user_one))
    end
    
    # test "should get index" do
    #     @category = categories(:test_one)   # use category fixtures here
    #     get category_tasks_path(category_id: @category.id)
        
    #     assert_response :success
    # end
    
    test "should get new" do
        @category = categories(:test_one)   # use category fixtures here
        get new_category_task_path(category_id: @category.id)

        assert_response :success
    end

    test "should post create" do
        @category = categories(:test_one)   # use category fixtures here
        post create_category_task_path(category_id: @category.id), params: { task: { name: "Task name", description: "Task Description", deadline: "2100-07-08 19:28:00" } }

        assert_response :redirect
    end

    test "when create task failed" do
        @category = categories(:test_one)   # use category fixtures here
        post create_category_task_path(category_id: @category.id), params: { task: { name: nil, description: "Task Description", deadline: "2100-07-08 19:28:00" } }

        assert_response :unprocessable_entity
    end

    test "should get show" do
        @category = categories(:test_one)   # use category fixtures here
        @task = tasks(:test_one)            # use task fixtures here
        get category_task_path(@category.id, @task.id)
        
        assert_response :success
    end
    
    test "should get edit" do
        @category = categories(:test_one)   # use category fixtures here
        @task = tasks(:test_one)            # use task fixtures here
        get edit_category_task_path(category_id: @category.id, id: @task.id)
        
        assert_response :success
    end
    
    test "should patch update" do
        @category = categories(:test_one)   # use category fixtures here
        @task = tasks(:test_one)            # use task fixtures here
        patch category_task_path(category_id: @category.id, id: @task.id), params: { task: { name: "Another Task name", description: "Another Task Description", deadline: "2100-07-08 19:28:00" } }
        
        assert_response :redirect
    end
    
    test "when update failed" do
        @category = categories(:test_one)   # use category fixtures here
        @task = tasks(:test_one)            # use task fixtures here
        patch category_task_path(category_id: @category.id, id: @task.id), params: { task: { name: "", description: "", deadline: "2100-07-08 19:28:00" } }
        
        assert_response :unprocessable_entity
    end
    
    test "should delete task" do
        @category = categories(:test_one)   # use category fixtures here
        @task = tasks(:test_one)            # use task fixtures here
        delete category_task_path(category_id: @category.id, id: @task.id)

        assert_response :redirect
    end

    test "should get tasks today" do
        get today_path

        assert_response :success
    end
    
    test "should get overdue tasks" do
        get overdue_path

        assert_response :success
    end
end