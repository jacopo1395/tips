class Question < ApplicationRecord
  serialize :options
  serialize :next_questions
  serialize :time_condition
  serialize :required_place_types
end
