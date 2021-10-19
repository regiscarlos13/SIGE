class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum sexo: [:MASCULINO, :FEMININO]
  enum situacao: [:Matriculado, :Transferido]
  enum tipo: [:mesma, :outra]
end

