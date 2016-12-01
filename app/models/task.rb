class Task < ApplicationRecord
	
	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true,  inclusion: { in: %w(alta media baja), message: "%{value} is not a valid size" }

	validates :state,  presence: true

	belongs_to :list
end
