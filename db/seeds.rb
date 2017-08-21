# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando administrador padrão"
User.create!(name: 'Tiago Piovesan', cpf: CPF.generate,email: "tiago.piovesan.tp@gmail.com", 
  password: "123456", password_confirmation: "123456", sex: 1, role: 1,birth: '03/09/1996', )
puts "Administrador padrão Cadastrado"



puts "Cadastrando administradores"
9.times do
  User.create!(name: Faker::GameOfThrones.character,cpf: CPF.generate, email: Faker::Internet.email, 
    password: "123456", password_confirmation: "123456", sex: [0,1].sample, role: [0,1].sample,birth: Faker::Date.birthday(18, 65) )
end
puts "Administradores Cadastrados"
