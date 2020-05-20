require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:michael)
    @other_user=users(:archer)
  end 
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {displayname: "",
      email:"foo@invalid",
      phone: "1234",
      password:"foo",
      password_confirmation:"bar"} }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do 
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    displayname = "Foo Bar"
    email = "foo@bar.com"
    phone = 1234567891
    patch user_path(@user), params: {user: {displayname:displayname,
      email: email,
      phone: phone,
      password:"",
      password_confirmation:""} }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal displayname, @user.displayname
    assert_equal email, @user.email
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    displayname="Foo Bar"
    email="foo@bar.com"
    phone = 1234567891
    patch user_path(@user), params: {user: {displayname:displayname,
      email: email,
      phone: phone,
      password:"",
      password_confirmation:""} }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal displayname, @user.displayname
    assert_equal email,@user.email
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user),params: {user: {displayname:@user.displayname,
      email:@user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user),params: {user: {displayname:@user.displayname,
      email:@user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
