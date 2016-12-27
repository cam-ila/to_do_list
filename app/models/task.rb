class Task < ApplicationRecord
	
	validates :description,  presence: {message: "No puede estar en blanco"}, length: { maximum: 255 }

	validates :priority,  presence: true, numericality: { only_integer: true }

	validates :state,  presence: true

	belongs_to :list


	def active?
		true
	end
end
