class SimpleTask < Task

	validates :state,  presence: true,  inclusion: { in: %w(pendiente hecha), message: "%{value} is not a valid size" }
	
end
