*** Settings ***
Resource         ../resources/amazon-resources.robot
Test Setup       Start Test

*** Test Cases ***
Teste-01
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria de Computadores e Informática
    [Tags]             menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página
    Sleep       2
    Take Screenshot    filename=paginaEletronicos

Teste-02
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Sleep       2
    Take Screenshot    filename=resultadoBuscaProduto
