require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               surname: "",
                               email: "user@isvalid",
                               password:              "foo",
                               password_confirmation: "foo" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Test3",
                                            surname: "Test3",
                                            email: "test3@test3.com",
                                            password:              "00000000",
                                            password_confirmation: "00000000" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end