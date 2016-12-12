class Task < ApplicationRecord
	
	validates :description,  presence: {message: "No puede estar en blanco"}, length: { maximum: 255 }

	validates :priority,  presence: true, numericality: { only_integer: true }

	validates :state,  presence: true

	belongs_to :list



	def to_ul 
		"#{self.description} </p> <p> <strong>Estado:</strong>  #{self.state}"
	end

	def active?
		true
	end
end
