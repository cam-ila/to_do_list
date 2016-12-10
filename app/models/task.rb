class Task < ApplicationRecord
	
	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true 

	validates :state,  presence: true

	belongs_to :list



	def to_ul 
		"<dl> <dt> #{self.description} </dt> <dd> #{self.priority} </dd> <dd> #{self.state} </dd> </dl> "
	end

	def active?
		true
	end
end
