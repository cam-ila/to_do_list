class TemporaryTask < Task
	before_save :check_date
	before_save :check_state
	after_find :check_state


	validates :state,  presence: true,  inclusion: { in: %w(pendiente hecha expirada), message: "%{value} is not a valid size" }

	validates :start,  presence: true
	validates :finish,  presence: true

	def to_ul 
		"#{self.description} </p> <p> <strong>Estado:</strong> #{self.state} <strong>Comienza:</strong> #{self.start} <strong>Finaliza:</strong> #{self.finish}"
	end

	def active?
		check_state()
		!(self.state == "expirada")
	end

	private
	def check_state ()
		if Date.today > self.finish
	        self.state = "expirada"
     	 end
    end

    def check_date()
      if self.start > self.finish
        f = self.finish
        self.finish = self.start
        self.start = f  
      end
    end

	
end
