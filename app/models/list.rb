class List < ApplicationRecord
	has_many :task, dependent: :destroy
end
