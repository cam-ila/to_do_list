class Task < ApplicationRecord
	
	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true 

	validates :state,  presence: true

	belongs_to :list



	def to_ul 
		"#{self.description} </p> <p> <strong>Estado:</strong>  #{self.state}"
	end

	def active?
		true
	end
end

 #{self.description}
 #{self.priority}
 #{self.state}