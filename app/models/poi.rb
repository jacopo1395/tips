class Poi < ApplicationRecord
	serialize :image, Array
	serialize :review, Array

	 attr_accessor :distance

	 # getter
	def get_distance
		@distance
	end

	# setter
	def set_distance=(val)
		@distance = val
	end
end
