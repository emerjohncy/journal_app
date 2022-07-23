require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in(users(:user_one))
    end

    test "should redirect to new user session path after signing out" do
        delete destroy_user_session_path

        assert_response :redirect
    end
end