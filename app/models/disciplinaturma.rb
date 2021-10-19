class Disciplinaturma < ApplicationRecord
  belongs_to :turma
  belongs_to :teacher
  belongs_to :subject
end
