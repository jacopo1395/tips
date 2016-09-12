# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Question attributes
# empty_question = {
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

# Completely reset Poi table
Poi.all.each do |poi|
  poi.destroy
end

poi= Poi.new
poi.name="da mario"
poi.rate=3.1
poi.types="ristorante"
poi.address="via roma 1"
poi.save

poi= Poi.new
poi.name="da luigi"
poi.rate="1"
poi.types="ristorante"
poi.address="via milano 2"
poi.save

poi= Poi.new
poi.name="da toad"
poi.rate=2
poi.types="ristorante"
poi.address="via bologna 3"
poi.save

poi= Poi.new
poi.name="da bowser"
poi.rate="3"
poi.types="ristorante"
poi.address="via firenze 4"
poi.save

poi= Poi.new
poi.name="da peach"
poi.rate="5"
poi.types="ristorante"
poi.address="via catania 5"
poi.save

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
  "Cena" => "cena",
  "Merenda" => "merenda",
  "Bere" => "bere",
  "Aperitivo" => "aperitivo",
  "Divertirmi" => "divertimento",
  "Scoprire i dintorni" => "scoprire",
  "Rilassarmi" => "relax",
  "Shopping" => "shopping",
  "Imparare" => "imparare"
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
]
question.save

question = Question.new
question.string_id = "pranzo"
question.text = "Vuoi sederti?"
question.options = {
  "No, non ho molto tempo" => "",
  "Si, mangio con tutta calma" => ""
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

question = Question.new
question.string_id = "merenda"
question.text = "Preferisci una merenda dolce o salata?"
question.options = {
  "Dolce" => "",
  "Salata" => ""
}
question.time_condition = {
  :from => "14:30:00",
  :to => "18:00:00"
}
question.required_place_types = %w[
  cafe
  gelateria
  pasticceria
]
question.save

question = Question.new
question.string_id = "bere"
question.text = "Cosa vorresti bere?"
question.options = {
  "Vino" => "",
  "Birra" => "",
  "Altro" => ""
}
question.time_condition = {
  :from => "21:30:00",
  :to => "24:00:00"
}
question.required_place_types = %w[
  pub
  enoteca
  birreria
  discoteca
]
question.save

question = Question.new
question.string_id = "aperitivo"
question.text = "Dove preferisci andare?"
question.options = {
  "Bar" => "",
  "Enoteca" => "",
  "Birrera" => ""
}
question.time_condition = {
  :from => "17:00:00",
  :to => "20:00:00"
}
question.required_place_types = %w[
  bar
  enoteca
  birreria
]
question.save

question = Question.new
question.string_id = "divertimento"
question.text = "Cosa preferisci fare?"
question.options = {
  "Ballare" => "",
  "Parco" => "",
  "Cinema" => "",
  "Teatro" => "",
  "Concerto" => "",
  "Sala giochi" => "",
  "Bowling" => ""
}
question.time_condition = {
  :from => "08:00:00",
  :to => "24:00:00"
}
question.required_place_types = %w[
  discoteca
  parco
  cinema
  teatro
  concerto
  sala_giochi
  bowling
]
question.save

question = Question.new
question.string_id = "scoprire"
question.text = "Dove preferisci andare?"
question.options = {
  "Parco" => "",
  "Luoghi di religione" => "",
  "Altri punti di interesse" => ""
}
question.time_condition = {
  :from => "08:00:00",
  :to => "21:00:00"
}
question.required_place_types = %w[
  luoghi_religione
  parco
  punti_di_interesse
]
question.save

question = Question.new
question.string_id = "relax"
question.text = "Sei da solo o in compagnia?"
question.options = {
  "Da solo" => "",
  "In compagnia" => ""
}
question.time_condition = {
  :from => "08:00:00",
  :to => "24:00:00"
}
question.required_place_types = %w[
  library
  cinema
  teatro
  parco
]
question.save

question = Question.new
question.string_id = "shopping"
question.text = "A cosa sei interessato?"
question.options = {
  "Libri" => "",
  "Vestiti" => "",
  "Scarpe" => ""
}
question.time_condition = {
  :from => "10:00:00",
  :to => "19:00:00"
}
question.required_place_types = %w[
  store
  book_store
  clothing_store
  shoe_store
]
question.save

question = Question.new
question.string_id = "imparare"
question.text = "Cosa ti piacerebbe imparare?"
question.options = {
  "Visita di arte e cultura" => "",
  "Scienza e natura" => "",
  "Letteratura" => ""
}
question.time_condition = {
  :from => "10:00:00",
  :to => "19:00:00"
}
question.required_place_types = %w[
  library
  book_store
  park
  aquarium
  zoo
  monument
  museum
  art_gallery
  church
]
question.save
