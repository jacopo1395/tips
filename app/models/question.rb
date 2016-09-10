class Question < ApplicationRecord
  serialize :options
  serialize :time_condition
  serialize :required_place_types
end
