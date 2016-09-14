class Question < ApplicationRecord
  serialize :options
  serialize :time_condition
  serialize :required_place_types
  serialize :additional_place_types
  serialize :place_types_to_keep

  attr_accessor :valid_options

  OPTION_COLORS = %w[
    mdl-color--orange
    mdl-color--green
    mdl-color--red
    mdl-color--cyan
    mdl-color--purple
    mdl-color--pink
  ]

  # Check what options can be shown to the user
  def check_options_conditions(search)
    @valid_options = Array.new

    self.options.each do |text, next_question_id|
      if !next_question_id.blank?
      #   @valid_options.push({ "text" => text, "next_question_id" => "domanda_generale" })
      # else
        next_question = Question.find_by(string_id: next_question_id)
        if !next_question.nil? && next_question.check_conditions(search)
          @valid_options.push({ "text" => text, "next_question_id" => next_question_id })
        end
      end
    end
  end

  # Used by check_options_conditions
  # Check if the question can be asked to the user
  def check_conditions(search)
    # Check time condition
    if !self.time_condition.nil? && !self.time_condition[:from].nil? && !self.time_condition[:to].nil?
      current_time = Time.now.strftime("%H:%M:%S")
      return false if current_time < self.time_condition[:from] || current_time > self.time_condition[:to]
    end

    return true if self.required_place_types.nil?

    # Check if at least one of the required places is present
    self.required_place_types.each do |required_place_type|
      if !search.places_by_type[required_place_type].nil?
        return true
      end
    end

    return false
  end
end
