class TemporaryTask < Task
	after_find :check_state

	validates :state,  presence: true,  inclusion: { in: %w(pendiente hecha expirada), message: "%{value} is not a valid size" }

	validates :start,  presence: true
	validates :finish,  presence: true

	def to_ul 
		"<dl> <dt> #{self.description} </dt> <dd> #{self.priority} </dd> <dd> #{self.state} </dd> <dd> #{self.start} </dd> <dd> #{self.finish} </dd> </dl>"
	end

	def active?
		!(self.state == "expirada")
	end

	private
	def check_state ()
		if Date.today > self.finish
	        self.state = "expirada"
	        self.save
     	 end
    end

	
end
