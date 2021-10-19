# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
    Student.create(
        name: Faker::Name.name, 
        nascimento: Faker::Date.birthday(min_age: 10, max_age: 15) , 
        sexo: Faker::Number.between(from: 0, to: 1), 
        mae: Faker::Name.name, 
        pai: Faker::Name.name, 
        cep: '63508-060',
        school_id: School.first.id,
        cpf: '01946712329'
        )
end
