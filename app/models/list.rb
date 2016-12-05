class List < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2 }

	validates :url, presence: true, uniqueness: true

	has_many :task, dependent: :destroy
	
	validates_associated :task
	
	#ver que el nombre no sea unico 
	def to_param
		url
	end
end
