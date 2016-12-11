class List < ApplicationRecord
	before_validation :slug, on: :create

	validates :name, presence: true, length: { minimum: 2 }

	validates :url, presence: true, uniqueness: true

	has_many :task, dependent: :destroy
	
	validates_associated :task

	def task_by_priority 
		self.task.order(:priority)
	end 
	
	#ver que el nombre no sea unico 
	def to_param
		url
	end

	def slug
		 self.url = self.name.parameterize
	end

end
