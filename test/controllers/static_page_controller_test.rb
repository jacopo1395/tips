require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
include Capybara::DSL
  # include Devise::Test::ControllerHelpers
  #
  # def setup
  #   @request.env["devise.mapping"] = Devise.mappings[:admin]
  #   sign_in FactoryGirl.create(:admin)
  # end

  # Test di prova. ritorna sempre vero
    test "the truth" do
      assert true
    end

  # effettua un login errato
  test "error login" do
    visit "/home"
    click_on('Entra')
    fill_in('Email', :with => 'John')
    fill_in('Password', :with => 'password')
    check('Ricordami')
    click_button('Login')
    page.assert_text('Errore')
  end




end
