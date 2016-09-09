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
#     :from => "",
#     :to => "",
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
question.string_id = "cosa_vuoi_fare"
question.text = "Cosa vuoi fare?"
question.options = {
  "Colazione" => "colazione",
  "Pranzo" => "pranzo",
  "Cena" => "",
  "Merenda" => "",
  "Bere" => "",
  "Aperitivo" => "",
  "Divertimento" => "",
  "Scoprire i dintorni" => "",
  "Rilassarmi" => "",
  "Shopping" => "",
  "Imparare" => ""
}
question.time_condition = {}
question.required_place_types = []
question.save

question = Question.new
question.string_id = "colazione"
question.text = "Preferisci una colazione dolce o salata?"
question.options = {
  "Dolce" => "",
  "Salata" => ""
}
question.time_condition = {
  :from => "06:00:00",
  :to => "11:00:00"
}
question.required_place_types = %w[
  bar
  cafe
  pasticceria
]
question.save

question = Question.new
question.string_id = "pranzo"
question.text = "Vai di fretta?"
question.options = {
  "Si" => "",
  "No" => ""
}
question.time_condition = {
  :from => "11:00:00",
  :to => "14:30:00"
}
question.required_place_types = %w[
  restaurant
]
question.save

question = Question.new
question.string_id = "cena"
question.text = "Che tipo di ristorante preferisci?"
question.options = {
  "Italiano" => "",
  "Orientale" => "",
  "Fast food" => ""
}
question.time_condition = {
  :from => "18:00:00",
  :to => "21:30:00"
}
question.required_place_types = %w[
  restaurant
]
question.save
