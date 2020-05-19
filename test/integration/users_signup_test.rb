# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { email: 'user@invalid', phone: 'bruh', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    # assert_not is_logged_in?
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { email: 'user@valid.com', phone: '12345678901', password: 'foobar', passwrd_confirmation: 'foobar' } }
    end
    follow_redirect!
    assert_template 'users/show'
    # assert is_logged_in?
  end
end
