require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "unsuccesfull edit" do
  	get edit_user_path(@user)
  	assert_templade "users/edit"
  	patch user_path(@user), params: { user:
  		{
  			name: "",
  			email: "phamhoang0210@gmail.com",
  			password: "123",
  			password_confirmation: "123"
  		}

  	}
  	assert_templade "users/edit"
  end
end
