class Poi < ApplicationRecord
	serialize :image, Array
	serialize :review, Array
end
