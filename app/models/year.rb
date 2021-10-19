class Year < ApplicationRecord
  belongs_to :school
  has_many :turmas, dependent: :destroy
  has_many :matriculas, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :students, through: :matriculas

  validates_presence_of :year, :inicio, :fim, :media
end
