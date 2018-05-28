require 'test_helper'

class UsersSignTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Invalig signup informatiom" do
  get signup_path
  assert_no_differences 'User.count',1 do
  	post users_path, params: {

  		user: {
  			name: "",
  			email: "phamhoang0210@gmail.com",
  			password: "123",
  			password_confirmation: "123"
  		}
  	}
  end
  follow_redirect!
  assert_templade "users/show"
  assert is_logged_in?
 end
end

