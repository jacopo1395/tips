# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Question model
# empty_question_model = {
#   :string_id => "",
#   :options => {
#
#   },
#   :next_questions => {
#
#   },
#   :time_condition => {
#     from: => "",
#     to: => "",
#   },
#   :required_place_types => [
#
#   ]
# }

# Completely reset Questions table
Question.all.each do |question|
  question.destroy
end

# Seed the database with the following questions.
question = Question.new
question.string_id = "first_question"
question.options = {
  "Mangiare" => "next_question_id",
  "Bere" => "next_question_id",
  "Uscire" => "next_question_id",
  "Rilassarmi" => "next_question_id"
}
question.time_condition = {}
question.required_place_types = []
question.save
