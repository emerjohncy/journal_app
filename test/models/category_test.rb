require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:user_one))
  end

  test "should not save category without name" do
    @category = Category.new
    assert_not @category.save
  end

  test "category can have many tasks" do
    @category = Category.create(name: "Personal")
    @task_one = Task.create(category_id: @category.id)
    @task_two = Task.create(category_id: @category.id)
    
    assert_equal @task_one.category, @task_two.category
  end
end
