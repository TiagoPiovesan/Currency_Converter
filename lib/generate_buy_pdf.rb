require 'prawn'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }
 
  def self.buy user, customer, value_input, value_out, currency_input_id, currency_out_id, created_at, updated_at 
    # Apenas uma string aleatório para termos um corpo de texto pro contrato
    lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum nulla id dignissim iaculis. Vestibulum a egestas elit, vitae feugiat velit. Vestibulum consectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat. Duis sed magna dignissim, lobortis tortor nec, suscipit velit. Nulla sit amet fringilla nisl. Integer tempor mauris vitae augue lobortis posuere. Ut quis tellus purus. Nullam dolor mauris, egestas varius ligula non, cursus faucibus orci sectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat."
 
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "333333"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      pdf.text "Relatório de Compra", :size => 26, :style => :bold, :align => :center
      # Move 80 PDF points para baixo o cursor
      pdf.move_down 30
      # Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
      pdf.text "

      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 30
      # Escreve o texto com os detalhes que o usuário entrou
      # pdf.text "#{created_at}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 11
      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome buy.pdf
      pdf.render_file("public/pdf/compra_#{(DateTime.now).strftime('%d-%m-%y_%H-%M-%S')}.pdf")
    end
  end
end
