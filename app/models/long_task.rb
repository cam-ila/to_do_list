class LongTask < Task

	validates :progress, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 100, greater_than_or_equal_to: 0,  }

end
