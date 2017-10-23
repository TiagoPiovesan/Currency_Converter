descriçao_cargo = [
  "Supervisiona: responsável pela imagem da empresa, pela satisfação dos clientes oferecendo os produtos conforme as suas necessidades.",
  "Trabalha com os demais setores da loja, pois são: loja; depósito e caixa. Mas na hora de movimento dá mais prioridades na área de venda.",    
  "Gerencia todos os processos da empresa, responsavel por cuidar do que os funcionários estão fazendo e tentar alcançar as métas diárias.",    
  "Responsável pela organização e separação das roupas devido nos seus lugares e cabides, responsável pelo um ótimo atendimento ao cliente."
]


puts "Cadastrando administrador padrão"

User.create!(
  name: 'Tiago Piovesan', 
  cpf: CPF.generate(true),
  email: "tiago.piovesan.tp@gmail.com", 
  password: "123456", 
  password_confirmation: "123456", 
  sex: 1, 
  facebook: 'https://www.facebook.com/tiago.piovesan',
  twitter: 'https://twitter.com',
  google: 'https://plus.google.com/',
  linkedin: 'https://www.linkedin.com/tiago-piovesan/',
  kind: 0,
  rmk: descriçao_cargo[2],
  role: 1,birth: '03/09/1996',
  avatar: File.new(Rails.root.join('public','templates', 'avatar_for_user','team-2.jpg'),'r')
  )

puts "Administrador padrão Cadastrado"

# -----

puts "Cadastrando administradores"

3.times do
  User.create!(
    name: Faker::GameOfThrones.character,
    cpf: CPF.generate, email: Faker::Internet.email, 
    password: "123456", 
    password_confirmation: "123456", 
    sex: [0,1].sample, role: [0,1].sample,
    facebook: 'https://www.facebook.com/',
    twitter: 'https://twitter.com',
    google: 'https://plus.google.com/',
    linkedin: 'https://www.linkedin.com/',
    kind: [1,2].sample,
    rmk: descriçao_cargo.sample,
    birth: Faker::Date.birthday(18, 65),
    avatar: File.new(Rails.root.join('public','templates', 'avatar_for_user',"team-#{[1,3,4].sample}.jpg"),'r')
    )
end

puts "Administradores Cadastrados"

# -----

User.all.each do |usuario|
  Random.rand(1..3).times do
    Phone.create(number: Faker::PhoneNumber.cell_phone, user: usuario)
  end
end

# -----

puts "Cadastrando Clientes"

100.times do
  Customer.create!(name: Faker::Name.name,cpf: CPF.generate(true), email: Faker::Internet.email, 
    sex: [0,1].sample,birth: Faker::Date.birthday(18, 65) )
end

puts "Clientes Cadastrados"

# -----

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

# -----

puts "Cadastrando telefone"

Customer.all.each do |customer|
  Random.rand(1..3).times do
    Phone.create(number: Faker::PhoneNumber.cell_phone, customer: customer)
  end
end

puts "Telefone Cadastrado"

# -----

puts "Cadastrando Compras"


143.times do
  Buy.create!(user: User.all.sample,
              customer: Customer.all.sample, 
              value_input: @value_input = Random.rand(50..1200), 
              value_out: Currency.buy_calculator(@value_input), 
              currency_input_id: Random.rand(0..18),
              currency_out_id: Random.rand(0..18),
              created_at: Date.today - Random.rand(0..30) 
            )
end

puts "Compras Cadastradas"

# -----

puts "Cadastrando vendas"

123.times do
  Sell.create!(user: User.all.sample,
               customer: Customer.all.sample,
               value_input: @value_input_sell = Random.rand(50..1200), 
               value_out: Currency.buy_calculator(@value_input_sell), 
               currency_input_id: Random.rand(0..18),
               currency_out_id: Random.rand(0..18),
               created_at: Date.today - Random.rand(0..30) 
              )
end

puts "vendas Cadastradas"

# -----

puts "Cadastrando empresa"

Company.create(
  id: 1, 
  name: "Currency Converter", 
  email: "currencyconverter@hotmail.com", 
  address: Address.last,
  facebook: 'https://www.facebook.com/',
  twitter: 'https://twitter.com',
  google: 'https://plus.google.com/',
  youtube: 'https://www.youtube.com/',
  about_us: 'Desde 1968 a Currency Converter Corretora vêm trilhando um caminho de sucesso no mercado de Câmbio, com toda certeza o fator chave para alcançar os resultados desejados, tem sido o reconhecimento da seriedade e da qualidade nos serviços prestados, o que também explica as sólidas parcerias firmadas com pessoas físicas e empresas de diversos setores da economia brasileira!',
)

puts "Empresa cadastrada"
 
# -----


