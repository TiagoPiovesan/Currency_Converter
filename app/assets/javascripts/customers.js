$(document).ready(function() {
    function limpa_formulário_cep() {
        // Limpa valores do formulário de cep.
        $("#customer_address_attributes_street").val("");
        $("#customer_address_attributes_neighborhood").val("");
        $("#customer_address_attributes_city").val("");
        $("#customer_address_attributes_state").val("");
    }
    
    //Quando o campo cep perde o foco.
    $("#customer_address_attributes_zipcode").blur(function() {

        //Nova variável "cep" somente com dígitos.
        var cep = $(this).val().replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#customer_address_attributes_street").val("Carregando...");
                $("#customer_address_attributes_neighborhood").val("Carregando...");
                $("#customer_address_attributes_city").val("Carregando...");
                $("#customer_address_attributes_state").val("Carregando...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("//viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#customer_address_attributes_street").val(dados.logradouro);
                        $("#customer_address_attributes_neighborhood").val(dados.bairro);
                        $("#customer_address_attributes_city").val(dados.localidade);
                        $("#customer_address_attributes_state").val(dados.uf);
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulário_cep();
                        alert("CEP não encontrado.");
                    }
                });
            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    });
});