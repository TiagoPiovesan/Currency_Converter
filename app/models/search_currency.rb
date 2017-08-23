class Search_currency
  Thread.new do
    loop do
      inicializacao_de_buscas
      #TIME em seg...
      sleep 100.0
    end
  end



  private

  def self.inicializacao_de_buscas
    puts '>>>>> Começando loop (STATUS)'

    puts '>>>>> Apagando tabela (STATUS)'
    drop_db
    puts '>>>>> Tabela Apagada (STATUS)'

    mechanize = Mechanize.new
    
    puts '>>>>> Buscando informações (STATUS)'
    page = mechanize.get('https://www.cotacao.com.br/cotacao-das-moedas.html')
    puts '>>>>> Buscadas as informações (STATUS)'

    @nome = []
    @valor = []

    @nome = recolher_dados_tabela('table tr td:first-child', page)
    @valor = recolher_dados_tabela('table tr td:nth-child(2)', page)

    puts "Nomes: #{@nome}"

    puts '>>>>> Iniciando adição (STATUS)'
    adicionar_no_model(@nome, @valor)

    puts '>>>>> Moedas ADICIONADAS (STATUS)'

    puts '>>>>> loop Finalizado (STATUS)'
  end

  def self.drop_db
    Currency.delete_all
  end

  def self.recolher_dados_tabela(select, page)
    @aux_busca = []
    doc = Nokogiri::HTML(page.body, "UTF-8")
    doc.css(select).each do |valor|
      @aux_busca.push(valor.text)
    end    
    @aux_busca
  end

  def self.adicionar_no_model(nome,valor)
    array_length = nome.size - 1
    for i in 0..array_length
      #percorrendo todas as moedas(nome, valor) para adiconar no modelo
      Currency.create(name: nome[i], price: valor[i][2,6])
    end    
  end
end