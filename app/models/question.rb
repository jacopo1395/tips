class Question < ApplicationRecord
  serialize :options
  serialize :time_condition
  serialize :required_place_types

  attr_accessor :valid_options

  def check_conditions(search)
    # Check time condition
    if !self.time_condition.nil? && !self.time_condition[:from].nil? && !self.time_condition[:to].nil?
      current_time = Time.now.strftime("%H:%M:%S")
      return false if current_time < self.time_condition[:from] || current_time > self.time_condition[:to]
    end

    return true

    # Check if at least one of the required places is present
    # self.required_place_types.each do |required_place_type|
    #   return true if !search.places_by_type[:required_place_type].nil?
    # end
    #
    # return false
  end

  def check_options_conditions(search)
    @valid_options = Array.new

    self.options.each do |text, next_question_id|
      next_question = Question.find_by(string_id: next_question_id)
      if next_question.check_conditions(search)
        @valid_options.push({ "text" => text, "next_question_id" => next_question_id })
      end
    end
  end
end
