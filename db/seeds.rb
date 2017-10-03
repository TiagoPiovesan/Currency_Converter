puts "Cadastrando administrador padrão"
User.create!(name: 'Tiago Piovesan', cpf: CPF.generate(true),email: "tiago.piovesan.tp@gmail.com", 
  password: "123456", password_confirmation: "123456", sex: 1, role: 1,birth: '03/09/1996', )
puts "Administrador padrão Cadastrado"


puts "Cadastrando administradores"
3.times do
  User.create!(name: Faker::GameOfThrones.character,cpf: CPF.generate, email: Faker::Internet.email, 
    password: "123456", password_confirmation: "123456", sex: [0,1].sample, role: [0,1].sample,
    birth: Faker::Date.birthday(18, 65) )
end
puts "Administradores Cadastrados"


User.all.each do |usuario|
  Random.rand(1..3).times do
    Phone.create(number: Faker::PhoneNumber.cell_phone, user: usuario)
  end
end

puts "Cadastrando Clientes"
100.times do
  Customer.create!(name: Faker::Name.name,cpf: CPF.generate(true), email: Faker::Internet.email, 
    sex: [0,1].sample,birth: Faker::Date.birthday(18, 65),  )
end
puts "Clientes Cadastrados"


puts "Cadastrando Endereços"
Customer.all.each do |customer|
  Address.create(
                city: Faker::Address.city,
                 number: Faker::Address.building_number,
                 state: Faker::Address.state,
                 neighborhood: Faker::Address.community,
                 street: Faker::Address.street_name,
                 zipcode: Faker::Address.zip_code,
                 customer: customer
           )
end
puts "Endereços cadastrandos!"

puts "Cadastrando telefone"
Customer.all.each do |customer|
  Random.rand(1..3).times do
    Phone.create(number: Faker::PhoneNumber.cell_phone, customer: customer)
  end
end
puts "Telefone Cadastrado"


puts "Cadastrando Compras"
150.times do
  Buy.create!(user: User.all.sample,customer: Customer.all.sample, value_input: Random.rand(50..1200), 
              currency_input_id: Random.rand(0..18), currency_out_id: Random.rand(0..18),
              created_at: Date.today - Random.rand(0..30) )
end
puts "Compras Cadastradas"


puts "Cadastrando vendas"
150.times do
  Sell.create!(user: User.all.sample,customer: Customer.all.sample, value_input: Random.rand(50..1200), 
              currency_input_id: Random.rand(0..18), currency_out_id: Random.rand(0..18),
              created_at: Date.today - Random.rand(0..30) )
end
puts "vendas Cadastradas"
