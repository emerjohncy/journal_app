require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task's association to category" do
    @category = Category.create(name: "My Task Name")
    @task = Task.create(category_id: @category.id)

    assert_equal @task.category, @category
  end
  
  test "should not save task when name is empty" do
    @category = Category.create(name: "My Task Name")
    @task = Task.new
    @task.description = "Task Description"
    @task.deadline = "2100-07-08 19:28:00"
    @task.category_id = @category.id

    assert_not @task.save
  end

  test "should not save task when name is not unique" do
    @category = Category.create(name: "My Task Name")
    Task.create(name: "My Unique Task Name", description: "Task Description", deadline: "2100-07-08 19:28:00", category_id: @category.id)
    @task = Task.new
    @task.name = "My Unique Task Name"
    @task.description = "Another Task Description"
    @task.deadline = "2100-07-08 19:28:00"
    @task.category_id = @category.id

    assert_not @task.save
  end

  test "should not save task when description is empty" do
    @category = Category.create(name: "My Task Name")
    @task = Task.new
    @task.name = "My Unique Task Name"
    @task.deadline = "2100-07-08 19:28:00"
    @task.category_id = @category.id

    assert_not @task.save
  end

  test "should not save task when deadline is empty" do
    @category = Category.create(name: "My Task Name")
    @task = Task.new
    @task.name = "My Unique Task Name"
    @task.description = "Task Description"
    @task.category_id = @category.id

    assert_not @task.save
  end
  
end
