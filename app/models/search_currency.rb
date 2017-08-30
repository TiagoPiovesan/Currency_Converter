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

    @name = []
    @value = []

    @name = recolher_dados_tabela('table tr td:first-child', page)
    @value = recolher_dados_tabela('table tr td:nth-child(2)', page)


    puts '>>>>> Iniciando adição (STATUS)'
    adicionar_no_model(@name, @value)

    puts '>>>>> Moedas ADICIONADAS (STATUS)'

    puts '>>>>> loop Finalizado (STATUS)'
  end

  def self.drop_db
    Currency.delete_all
  end

  def self.recolher_dados_tabela(select, page)
    @aux_busca = []
    doc = Nokogiri::HTML(page.body, "UTF-8")
    doc.css(select).each do |value|
      @aux_busca.push(value.text)
    end    
    @aux_busca
  end

  def self.adicionar_no_model(name,value)
    array_length = name.size - 1
    for i in 0..array_length
      aux = value[i].gsub(',', '.')[2,8]

      Currency.create(name: name[i], price: aux)
    end    
  end
end