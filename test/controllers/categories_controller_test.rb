require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
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

    test "should get show" do
        @category = categories(:test_one)    # Use category fixtures here
        get category_path(@category.id)

        assert_response :success
    end

    test "should get edit" do
        @category = categories(:test_one)    # Use category fixtures here
        get edit_category_path(@category.id)

        assert_response :success
    end
    
    test "should patch update" do
        @category = categories(:test_one)    # Use category fixtures here
        patch update_category_path(@category.id), params: { category: { name: "Avion Editted" }}

        assert_response :redirect
    end

    #test when category.save return false

    #test when update category failed


end