class Question < ApplicationRecord
  serialize :options
  serialize :next_questions
end
