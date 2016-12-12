class List < ApplicationRecord
	before_validation :slug, on: :create

	validates :name, presence: {message: "No puede estar en blanco"}, length: { minimum: 2, message: "Minimo 2 caracteres" }

	validates :url, presence: {message: ""}, uniqueness: {message: "Ya existe una lista con ese nombre"}

	has_many :task, -> { order('priority ASC') }, dependent: :destroy
	
	validates_associated :task

	def to_param
		url
	end

	def slug
		 self.url = self.name.parameterize
	end

end
