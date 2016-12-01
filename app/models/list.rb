class List < ApplicationRecord
	validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :url, presence: true, uniqueness: true

	has_many :task, dependent: :destroy
	validates_associated :task
end
