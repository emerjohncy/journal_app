require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can have many categories" do
    @user = users(:user_one)
    @category_one = Category.create(user_id: @user.id)
    @category_two = Category.create(user_id: @user.id)

    assert_equal @category_one.user, @category_two.user
  end

  test "user can have many tasks" do
    @user = users(:user_one)
    @category = categories(:test_one)
    @task_one = Task.create(category_id: @category.id)
    @task_two = Task.create(category_id: @category.id)

    assert_equal @task_one.user, @task_two.user
  end
end
