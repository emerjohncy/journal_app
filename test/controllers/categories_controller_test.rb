require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in(users(:user_one))
    end

    test "should get index" do
        get categories_path

        assert_response :success
    end

    test "should get new" do
        get new_category_path

        assert_response :success
    end
    
    test "should post create" do
        post create_category_path, params: { category: { name: "Personal" } }

        assert_response :redirect
    end

    test "when create category failed" do
        post create_category_path, params: { category: { name: "" } }

        assert_response :unprocessable_entity
    end

    # test "should get show" do
    #     @category = categories(:test_one)    # Use category fixtures here
    #     get category_path(@category.id)

    #     assert_response :success
    # end

    test "should get edit" do
        @category = categories(:test_one)    # Use category fixtures here
        get edit_category_path(@category.id)

        assert_response :success
    end
    
    test "should patch update" do
        @category = categories(:test_one)    # Use category fixtures here
        patch update_category_path(@category.id), params: { category: { name: "Avion Editted" } }

        assert_response :redirect
    end

    test "when update category failed" do
        @category = categories(:test_two)    # Use category fixtures here
        patch update_category_path(@category.id), params: { category: { name: ""} }
        
        assert_response :unprocessable_entity
    end

    test "should delete destroy" do
        @category = categories(:test_one)    # Use category fixtures here
        delete delete_category_path(@category.id)
        
        assert_response :redirect
    end
    
    test "should redirect to root path when user is not the owner of the category" do
        @category = categories(:test_three)    # Use category fixtures here
        get edit_category_path(@category.id)
        
        assert_response :redirect
    end
end