class TemporaryTask < Task
	validates :state,  presence: true,  inclusion: { in: %w(pendiente hecha expirada), message: "%{value} is not a valid size" }

	validates :start,  presence: true
	validates :finish,  presence: true
end
