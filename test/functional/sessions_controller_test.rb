require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "home page title should be 'SocialCamp | Sign in'" do
    get :new
    assert_select 'title', 'SocialCamp | Sign in'
  end
  
  test "user should login with correct user name and password" do
    john = users(:john)
    post :create, email: john.email, password: '1234Abcd'
    assert_redirected_to john
    assert_equal john.id, cookies[:user_id]
    
    # TODO: test with helper methods?
    # assert signed_in?
  end
  
  # TODO: add tests against sign in/out links
  # test "user should see account links after signin" do
  #     john = users(:john)
  #     post :create, email: john.email, password: '1234Abcd'
  #     assert_redirected_to john
  #     assert_select 'a', "Profile"
  #   end
  
  test "user should not login with incorrect user name or password" do
    john = users(:john)
    post :create, email: john.email, password: 'wrong'
    assert_template 'new'
    assert_nil cookies[:user_id]
  end
  
  test "logged in user should be able to sign out" do
    delete :destroy
    assert_redirected_to root_path
    assert_nil cookies[:user_id]
  end
end