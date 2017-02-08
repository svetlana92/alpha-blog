require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

    test "user sign up successfully and redirect to show page" do
        get signup_path
        assert_template 'users/new'
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: { username: 'Test', email: 'test@example.com', password: 'password' }
        end
        assert_template 'users/show'
    end

end