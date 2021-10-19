class Matricula < ApplicationRecord
  
  belongs_to :year
  belongs_to :student
  belongs_to :turma
  has_one :situation, dependent: :destroy


end
 