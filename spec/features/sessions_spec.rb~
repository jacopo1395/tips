require 'spec_helper'

describe "User Sessions" do
  let!(:user) { User.create(username: username,email: email, password: password, password_confirmation: password) }
  let(:email) { 'jill@example.com' }
  let(:password) { 'password' }

  before do
    visit root_path
    within('.navbar') { click_link('Entra') }
  end

  context "failure" do
    before do
      # try to sign in without a password
    end

    it "displays an error message" do
      pending
    end

    it "shows the correct navigation links" do
      # should still see 'Sign in' and 'Sign up'
      # should not see 'Profile' or 'Sign out'
      pending
    end
  end

  context "success" do
    before do
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		click_button 'Entra'
    end

    it "displays a welcome message" do
      expect(page).to have_content('Signed in successfully.')
    end

    it "shows the correct navigation links" do
      expect(page).to have_link('Home')
	  expect(page).to have_link('')
      expect(page).to have_link('Entra')
      expect(page).to have_link('Nuovo Utente?')
	  expect(page).to have_link('È la prima volta? Registrati!')
	  expect(page).to have_link('Hai dimenticato la password?')
	  expect(page).to have_link('Entra con Facebook')
	  expect(page).to check('Ricordami')
      pending
    end
  end
end
