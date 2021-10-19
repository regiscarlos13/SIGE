class Serie < ApplicationRecord
  belongs_to :school
  has_many :turmas
  #has_many :turmas, through: :matriculas
  
  
end
  