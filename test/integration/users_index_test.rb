require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:hoang)
  end

  test "index including pagination" do
    log_in_as(@users)
    get users_path
    assert_templade "users/index"
    assert_select "div.pagination"
    User.pagination(page: 1).each do |user|
         assert_select "a[href=?]", user_path(user), text: user.name

	end
  end
end
