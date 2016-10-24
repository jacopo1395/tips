require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
	include Capybara::DSL
	test "cosa posso fare" do
		visit "/home"
		click_on "Cosa posso fare?"
		expect(page).to have_current_path("/search")
		click_on "Colazione"
		expect(page).to have_current_path("/search?next_question_id=colazione")
		click_on "Dolce"
		expect(page).to have_current_path("/search?next_question_id=colazione_dolce")
		click_on "Pasticceria"
		expect(page).to have_current_path("/final_quest")
		find('rating').set('3')
		find('price').set('3')
		find('distance').set('100')
		click_on"Avanti"
		expect(page).to have_current_path("/pois")
	end
end
