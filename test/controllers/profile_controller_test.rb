require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # test "should get show" do
  #   get profile_show_url
  #   assert_response :success
  # end

  test "sigup" do
    visit "/home"
    click_on('Nuovo utente?')
    click_on('Registrati')
    fill_in('Username', :with => 'John')
    fill_in('Email', :with => 'John')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_button('Registrati')
  end

  test "my profile" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on(user.username)
  end

end
