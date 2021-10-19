class Turma < ApplicationRecord
  belongs_to :serie
  belongs_to :year

  has_many :disciplinaturmas, dependent: :destroy
  has_many :matriculas, dependent: :destroy
  has_many :students, through: :matriculas
  
  

  accepts_nested_attributes_for :disciplinaturmas, reject_if: :all_blank, allow_destroy: true
end
