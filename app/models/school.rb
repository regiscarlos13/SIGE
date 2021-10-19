class School < ApplicationRecord
	has_many :users
	has_many :years
	has_many :subjects
	has_many :series
	has_many :students
	has_many :turmas
	has_many :teachers
	has_one_attached :logo, dependent: :purge_later
#	belongs_to :year

end
