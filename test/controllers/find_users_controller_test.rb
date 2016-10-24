require 'test_helper'

class FindUsersControllerTest < ActionDispatch::IntegrationTest
	include Capybara::DSL
	test "cerca" do
  		visit "/home"
  		click_on 'search'
  		fill_in('search', :with => 'Jhon\n')
  		page.assert_text('Utenti Trovati')
  	end
end
