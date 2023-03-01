*** Settings ***
Resource         ../resources/mais-amazon-resources.robot
Test Setup       Start Test

*** Test Cases ***
Teste-03
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Controle Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Controle Xbox Series S"
    Adicionar o produto "Controle Xbox Series S" no carrinho
    Verificar se o produto "Controle Xbox Series S" foi adicionado com sucesso
    Sleep       2
    Take Screenshot    filename=controleXboxSeriesS

Teste-04
     [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
     [Tags]             remover_carrinho
     Acessar a home page do site Amazon.com.br
     Digitar o nome de produto "Controle Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa
     Verificar o resultado da pesquisa se está listando o produto "Controle Xbox Series S"
     Adicionar o produto "Controle Xbox Series S" no carrinho
     Verificar se o produto "Controle Xbox Series S" foi adicionado com sucesso
     Remover o produto "Controle Xbox Series S" do carrinho
     Verificar se o carrinho fica vazio
     Sleep       2
     Take Screenshot    filename=resultadoBuscaProduto
