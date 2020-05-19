require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #[1, Chapter 6]

  def setup 
    @user = User.new(email: "user@example.com", displayname: "", phone:"12345678901", password: "foobar", password_confirmation: "foobar")
  end 

  test "should be valid" do 
    assert @user.valid? 
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "display name can be empty" do
    @user.displayname = ""
    assert @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 254 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address| 
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid" 
    end
  end

  test "email validation should reject invalid addresses" do 
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com] 
    invalid_addresses.each do |invalid_address| 
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicated_user = @user.dup
    duplicated_user.email = @user.email.upcase
    @user.save
    assert_not duplicated_user.valid?
  end

  test "email address should be saved as lower-case" do
    non_lowercase_email = "bAd@EmAiL.CoM"
    @user.email = non_lowercase_email
    @user.save
    assert_equal non_lowercase_email.downcase, @user.reload.email
  end

  test "validation should accept valid phone numbers" do
    valid_phone = %w[1234567891 12345678901 123456789012 1234567890123]
    valid_phone.each do |valid_phone| 
        @user.phone = valid_phone
        assert @user.valid?, "#{valid_phone.inspect} should be valid" 
    end
  end

  test "validation should not accept invalid phone numbers" do
    invalid_phone = %w[123456789 12345678901231 1234aaa89012 1234AAA89012 abcdefghijkl]
    invalid_phone.each do |invalid_phone| 
        @user.phone = invalid_phone
        assert_not @user.valid?, "#{invalid_phone.inspect} should be invalid" 
    end
    @user.phone = ""
    assert_not @user.valid?, "empty number should be invalid" 
    @user.phone = "1234aaa89012"
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation= "" * 6
    assert_not @user.valid? 
  end 

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" *5
    assert_not @user.valid?
  end

end
