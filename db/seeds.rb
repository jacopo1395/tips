# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

# Question attributes
# empty_question = {
#   :string_id => "",
#   :options => {
#
#   },
#   :time_condition => {
#     :from => "",
#     :to => "",
#   },
#   :required_place_types => [
#
#   ],
#   :additional_place_types => [
#
#   ],
#   :place_types_to_keep => [
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
question.time_condition = nil
question.required_place_types = nil
question.additional_place_types = nil
question.place_types_to_keep = nil
question.save

#########################################################
######COLAZIONE
#########################################################

question = Question.new
question.string_id = "colazione"
question.text = "Preferisci una colazione dolce o salata?"
question.options = {
  "Dolce" => "colazione_dolce",
  "Salata" => "colazione_salata"
}
question.time_condition = {
  :from => "06:00:00",
  :to => "11:00:00"
}
question.required_place_types = %w[
  bar
  cafe
]

question.additional_place_types =  %w[
  pasticceria
]
question.place_types_to_keep = nil
question.save

  ######colazione Dolce
  question = Question.new
  question.string_id = "colazione_dolce"
  question.text = "Dove preferisci fare colazione?"
  question.options = {
    "Pasticceria" => "colazione_pasticceria",
    "Bar" => "colazione_bar",
    "Caffetteria" => "colazione_caffetteria"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = %w[
    bar
    cafe
    pasticceria
  ]
  question.save

  ######colazione salata
  question = Question.new
  question.string_id = "colazione_salata"
  question.text = "Dove preferisci fare colazione?"
  question.options = {
    "Bar" => "colazione_bar",
    "Caffetteria" => "colazione_caffetteria"
  }

  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = question.place_types_to_keep = %w[
    bar
    cafe
  ]
  question.save

    ######colazione pasticceria
    question = Question.new
    question.string_id = "colazione_pasticceria"
    question.text = "Domanda?"
    question.options = nil
    question.time_condition = nil
    question.required_place_types = %w[
      pasticceria
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = %w[
      pasticceria
    ]
    question.save

    ######colazione bar
    question = Question.new
    question.string_id = "colazione_bar"
    question.text = "Domanda?"
    question.options = nil
    question.time_condition = nil
    question.required_place_types = %w[
      bar
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = %w[
      bar
    ]
    question.save

    ######colazione caffetteria
    question = Question.new
    question.string_id = "colazione_caffetteria"
    question.text = "Domanda?"
    question.options = nil
    question.time_condition = nil
    question.required_place_types = %w[
      cafe
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = %w[
      cafe
    ]
    question.save

#########################################################
######PRANZO
#########################################################

question = Question.new
question.string_id = "pranzo"
question.text = "Vuoi sederti?"
question.options = {
  "No, non ho molto tempo" => "pasto_in_piedi",
  "Si, mangio con tutta calma" => "pasto_seduto"
}
question.time_condition = {
  :from => "06:00:00",
  :to => "24:00:00"
}
question.required_place_types = %w[
  restaurant
]
question.additional_place_types = nil
question.place_types_to_keep = %w[
  restaurant
]
question.save

  ######pranzo no
  question = Question.new
  question.string_id = "pasto_in_piedi"
  question.text = "Dove preferisci mangiare?"
  question.options = {
    "Fast food" => "pasto_fast_food",
    "Pizzeria al taglio" => "pasto_pizza_al_taglio",
    "Kebab" => "pasto_kebab",
    "Paninoteca" => "pasto_paninoteca"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = %w[
    pizzeria
    paninoteca
    kebab
    fast+food
  ]
  question.place_types_to_keep = nil
  question.save

  ######pranzo si
  question = Question.new
  question.string_id = "pasto_seduto"
  question.text = "Quale tipo di ristorante preferisci?"
  question.options = {
    "Italiano" => "pasto_italiano",
    "Orientale" => "pasto_orientale",
    "Fast food" => "pasto_fast_food"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = %w[
    ristorante+giapponese
    ristorante+italiano
    ristorante+cinese
    fast+food
  ]
  question.place_types_to_keep = nil
  question.save

#############################
    ######pasto fast food
    question = Question.new
    question.string_id = "pasto_fast_food"
    question.text = "Domanda?"
    question.options = {
      "Pasta" => "",
      "Pizza" => "",
      "Pesce" => "",
      "Carne" => "",
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = %w[
    fast+food
    ]
    question.save

    ######pasto pizzeria
    question = Question.new
    question.string_id = "pasto_pizza_al_taglio"
    question.text = "Domanda?"
    question.options = {
      "Pizza" => "",
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = %w[
    pizzeria
    ]
    question.save

    ######pasto kebab
    question = Question.new
    question.string_id = "pasto_kebab"
    question.text = "Domanda?"
    question.options = {
      "Kebab" => "",
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

    ######pasto paninoteca
    question = Question.new
    question.string_id = "pasto_paninoteca"
    question.text = "Domanda?"
    question.options = {
      "Panino" => "",
    }
    question.time_condition = nil
    question.required_place_types = %w[
    paninoteca
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save



####################################
    ######pasto italiano
    question = Question.new
    question.string_id = "pasto_italiano"
    question.text = "Quali piatti preferisci mangiare oggi?"
    question.options = {
      "Pasta" => "",
      "Pizza" => "",
      "Pesce" => "",
      "Carne" => "",
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = %w[
      "ristorante+pasta",
      "pizzeria",
      "ristorante+pesce",
      "ristorante+carne"
    ]
    question.place_types_to_keep = []
    question.save

    ######pasto orientale
    question = Question.new
    question.string_id = "pasto_orientale"
    question.text = "Quale tipo di cucina preferisci?"
    question.options = {
      "Giapponese" => "pasto_orientale_giapponese",
      "Cinese" => "pasto_orientale_cinese",
      "Coreano" => "pasto_orientale_coreano",
      "Indiano" => "pasto_orientale_indiano",
      "Thailandese" => "pasto_orientale_thailandese"
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = %w[
      ristorante+coreano
      ristorante+indiano
      ristorante+thailandese
    ]
    question.place_types_to_keep = %[
      ristorante+giapponese
      ristorante+cinese
    ]
    question.save

      question = Question.new
      question.string_id = "pasto_orientale_giapponese"
      question.text = nil
      question.options = nil
      question.time_condition = nil
      question.required_place_types = %w[
        ristorante+giapponese
      ]
      question.additional_place_types = nil
      question.place_types_to_keep = "ristorante+giapponese"
      question.save

      question = Question.new
      question.string_id = "pasto_orientale_cinese"
      question.text = nil
      question.options = nil
      question.time_condition = nil
      question.required_place_types = %w[
        ristorante+cinese
      ]
      question.additional_place_types = nil
      question.place_types_to_keep = "ristorante+cinese"
      question.save

      question = Question.new
      question.string_id = "pasto_orientale_coreano"
      question.text = nil
      question.options = nil
      question.time_condition = nil
      question.required_place_types = %w[
        ristorante+coreano
      ]
      question.additional_place_types = nil
      question.place_types_to_keep = "ristorante+coreano"
      question.save

      question = Question.new
      question.string_id = "pasto_orientale_indiano"
      question.text = nil
      question.options = nil
      question.time_condition = nil
      question.required_place_types = %w[
        ristorante+indiano
      ]
      question.additional_place_types = nil
      question.place_types_to_keep = "ristorante+indiano"
      question.save

      question = Question.new
      question.string_id = "pasto_orientale_thailandese"
      question.text = nil
      question.options = nil
      question.time_condition = nil
      question.required_place_types = %w[
        ristorante+thailandese
      ]
      question.additional_place_types = nil
      question.place_types_to_keep = "ristorante+thailandese"
      question.save

#########################################################
######CENA
#########################################################

question = Question.new
question.string_id = "cena"
question.text = "Che tipo di ristorante preferisci?"
question.options = {
    "Italiano" => "pasto_italiano",
    "Orientale" => "pasto_orientale",
    "Fast food" => "pasto_fast_food"
  }
  question.time_condition = {
  :from => "18:00:00",
  :to => "21:30:00"
  }
  question.required_place_types = %w[
  restaurant
  ]
  question.additional_place_types = %w[
    ristorante+giapponese
    ristorante+italiano
    ristorante+cinese
    fast+food
  ]
  question.place_types_to_keep = nil
  question.save

#########################################################
######MERENDA
#########################################################

question = Question.new
question.string_id = "merenda"
question.text = "Preferisci una merenda dolce o salata?"
question.options = {
  "Dolce" => "merenda_dolce",
  "Salata" => "merenda_salata"
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

  ######MERENDA DOLCE
  question = Question.new
  question.string_id = "merenda_dolce"
  question.text = "Dove preferisci fare merenda?"
  question.options = {
    "Pasticceria" => "merenda_pasticceria",
    "Gelateria" => "merenda_gelateria"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######MERENDA SALATA
  question = Question.new
  question.string_id = "merenda_salata"
  question.text = "Dove preferisci fare merenda?"
  question.options = {
    "Fast food" => "pasto_fast_food",
    "Paninoteca" => "pasto_paninoteca"

  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

    ######merenda pasticceria
    question = Question.new
    question.string_id = "merenda_pasticceria"
    question.text = "Domanda?"
    question.options = {}
    question.time_condition = nil
    question.required_place_types = %w[
      pasticceria
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

    ######merenda gelateria
    question = Question.new
    question.string_id = "merenda_gelateria"
    question.text = "Domanda?"
    question.options = {}
    question.time_condition = nil
    question.required_place_types = %w[
      gelateria
    ]
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save


#########################################################
######BERE
#########################################################

question = Question.new
question.string_id = "bere"
question.text = "Cosa vorresti bere?"
question.options = {
  "Vino" => "bere_vino",
  "Birra" => "bere_birra",
  "Altro" => "bere_altro"
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

  ######bere birra
  question = Question.new
  question.string_id = "bere_birra"
  question.text = "Che tipo di locale preferisci?"
  question.options = {
    "Birreria" => "birreria",
    "Pub" => "pub"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

    ######birreria
    question = Question.new
    question.string_id = "birreria"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

  ######bere altro
  question = Question.new
  question.string_id = "bere_altro"
  question.text = "Che tipo di locale preferisci?"
  question.options = {
    "Discoteca" => "discoteca",
    "Pub" => "pub"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

    ######discoteca
    question = Question.new
    question.string_id = "discoteca"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

    ######pub
    question = Question.new
    question.string_id = "pub"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

  ######bere vino
  question = Question.new
  question.string_id = "bere_vino"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

#########################################################
######APERITIVO
#########################################################

question = Question.new
question.string_id = "aperitivo"
question.text = "Dove preferisci andare?"
question.options = {
  "Bar" => "pub",
  "Enoteca" => "bere_vino",
  "Birrera" => "birreria"
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

#########################################################
######DIVERTIMENTO
#########################################################

question = Question.new
question.string_id = "divertimento"
question.text = "Cosa preferisci fare?"
question.options = {
  "Ballare" => "discoteca",
  "Parco" => "parco",
  "Cinema" => "cinema",
  "Teatro" => "teatro",
  "Concerto" => "concerto",
  "Sala giochi" => "sala_giochi",
  "Bowling" => "bowling"
}
question.time_condition = {
  :from => "08:00:00",
  :to => "24:00:00"
}
question.required_place_types = %w[
  night_club
  park
  movie_theater
  teatro
  concerto
  sala_giochi
  bowling
]
question.save

  ######parco
  question = Question.new
  question.string_id = "parco"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######cinema
  question = Question.new
  question.string_id = "cinema"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######teatro
  question = Question.new
  question.string_id = "teatro"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######concerto
  question = Question.new
  question.string_id = "concerto"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######sala giochi
  question = Question.new
  question.string_id = "sala_giochi"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######bowling
  question = Question.new
  question.string_id = "bowling"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

#########################################################
######SCOPRIRE
#########################################################

question = Question.new
question.string_id = "scoprire"
question.text = "Dove preferisci andare?"
question.options = {
  "Parco" => "parco",
  "Luoghi di religione" => "luogo_religioso",
  "Altri punti di interesse" => "punto_interesse"
}
question.time_condition = {
  :from => "08:00:00",
  :to => "21:00:00"
}
question.required_place_types = %w[
  park
  point_of_interest
]
question.save

  ######luogo_religioso
  question = Question.new
  question.string_id = "luogo_religioso"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

  ######punto_interesse
  question = Question.new
  question.string_id = "punto_interesse"
  question.text = "Domanda?"
  question.options = {
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

#########################################################
######RELAX
#########################################################

question = Question.new
question.string_id = "relax"
question.text = "Sei da solo o in compagnia?"
question.options = {
  "Da solo" => "relax_da_solo",
  "In compagnia" => "relax_in_compagnia"
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
  question.string_id = "relax_da_solo"
  question.text = "Dove vuoi andare?"
  question.options = {
    "Parco" => "parco",
    "Biblioteca" => "biblioteca"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

    ######biblioteca
    question = Question.new
    question.string_id = "biblioteca"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

  question = Question.new
  question.string_id = "relax_in_compagnia"
  question.text = "Dove vuoi andare?"
  question.options = {
    "Parco" => "parco",
    "Cinema" => "cinema",
    "Teatro" => "teatro"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

#########################################################
######SHOPPING
#########################################################

question = Question.new
question.string_id = "shopping"
question.text = "A cosa sei interessato?"
question.options = {
  "Libri" => "libri",
  "Vestiti" => "vestiti",
  "Scarpe" => "scarpe"
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

	######libri
    question = Question.new
    question.string_id = "libri"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

	######vestiti
    question = Question.new
    question.string_id = "vestiti"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

    ######scarpe
    question = Question.new
    question.string_id = "scarpe"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

#########################################################
######imparare
#########################################################

question = Question.new
question.string_id = "imparare"
question.text = "Cosa ti piacerebbe imparare?"
question.options = {
  "Visita di arte e cultura" => "imparare_arte",
  "Scienza e natura" => "imparare_natura",
  "Letteratura" => "imparare_letteratura"
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

  question = Question.new
  question.string_id = "imparare_letteratura"
  question.text = "Dove ti piacerebbe andare?"
  question.options = {
    "Biblioteca" => "biblioteca",
    "Libreria" => "libreria"

  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save


    ######libreria
    question = Question.new
    question.string_id = "libreria"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

  question = Question.new
  question.string_id = "imparare_natura"
  question.text = "Dove ti piacerebbe andare?"
  question.options = {
    "Parco" => "parco",
    "Zoo" => "zoo",
    "Acquario" => "acquario"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save

    ######zoo
    question = Question.new
    question.string_id = "zoo"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

    ######acquario
    question = Question.new
    question.string_id = "acquario"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save

  question = Question.new
  question.string_id = "imparare_arte"
  question.text = "Dove ti piacerebbe andare?"
  question.options = {
    "Monumenti" => "monumento",
    "Museo" => "museo",
    "Chiese" => "luogo_religioso",
    "Galleria d' arte" => "galleria_arte"
  }
  question.time_condition = nil
  question.required_place_types = nil
  question.additional_place_types = nil
  question.place_types_to_keep = nil
  question.save


    ######monumento
    question = Question.new
    question.string_id = "monumento"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save


    ######museo
    question = Question.new
    question.string_id = "museo"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save


    ######galleria_arte
    question = Question.new
    question.string_id = "galleria_arte"
    question.text = "Domanda?"
    question.options = {
    }
    question.time_condition = nil
    question.required_place_types = nil
    question.additional_place_types = nil
    question.place_types_to_keep = nil
    question.save
