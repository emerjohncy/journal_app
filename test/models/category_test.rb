require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not save category without name" do
    @category = Category.new
    assert_not @category.save
  end

  test "should not save category when name is not unique" do
    Category.create(name: "Personal")
    @category = Category.new(name: "Personal")
    assert_not @category.save
  end

  # test "create category" do
  #   @category = Category.new

  #   assert @category.save
  # end

  # test "task association to category" do
  #   @category = Category.create(name: "Personal")

  #   assert_equal @category.tasks.length, 0
  # end

  test "category can have many tasks" do
    @category = Category.create(name: "Personal")
    @task_one = Task.create(category_id: @category.id)
    @task_two = Task.create(category_id: @category.id)

    assert_equal @task_one.category, @task_two.category
  end
  

end
