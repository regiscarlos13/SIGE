class Subject < ApplicationRecord
  validates_presence_of :name
  
    belongs_to :school
end
