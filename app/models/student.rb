class Student < ApplicationRecord
  belongs_to :school
  has_many :matriculas
  has_many :turmas, through: :matriculas
  has_many :years

  has_many :posts

  validates_presence_of :name, :nascimento, :sexo, :mae, :cep

before_save :save_cpf

  

  def student
    "#{name} - #{nascimento.strftime("%d/%m/%Y")}" 
  end

  private
  def save_cpf
  	
  	self.cpf = self.cpf.gsub(/[.-]/, "")  
  	self.cpfpai = self.cpfpai.gsub(/[.-]/, "")  
  	self.cpfmae = self.cpfmae.gsub(/[.-]/, "")  
  	self.cep = self.cep.gsub(/[.-]/, "")  

  end
end
