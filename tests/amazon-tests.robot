*** Settings ***
Resource         ../resources/amazon-resources.robot
Test Setup       Start Test

*** Test Cases ***
Teste-01
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria de Computadores e Informática
    [Tags]             menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página aparece "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"
    Sleep       2
    Take Screenshot    filename=paginaEletronicos

Teste-02
     [Documentation]    Esse teste verifica a busca de um produto
     [Tags]             busca_produtos    lista_busca
     Acessar a home page do site Amazon.com.br
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa
     Verificar o resultado da pesquisa, listando o produto pesquisado "Xbox Series S"
     Sleep       2
     Take Screenshot    filename=resultadoBuscaProduto