*** Settings ***
Documentation    Arquivo Principal do Projeto
Library          Browser

*** Variables ***
${url}                             https://www.amazon.com.br
${menu_eletronicos}                //a[contains(@data-csa-c-content-id,'nav_cs_electronics')]
${header_eletronicos}              //h1[contains(.,'Eletrônicos e Tecnologia')]
${titutlo_pagina_eletronicos}      Eletrônicos e Tecnologia | Amazon.com.br

*** Keywords ***
Start Test
    New Browser          headless=false
    New Context          viewport={'width': 1440, 'height': 768}

Acessar a home page do site Amazon.com.br
    New Page    ${url}
    Wait For Elements State    ${menu_eletronicos}    visible

Entrar no menu "Eletrônicos"
    Click    ${menu_eletronicos}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Get Text    ${header_eletronicos}

Verificar se o título da página aparece "${titulo}"
    Get Title    contains    ${titulo}

Verificar se aparece a categoria "${nome_categoria}"
    Wait For Elements State    //img[contains(@alt,'${nome_categoria}')]    visible

Digitar o nome de produto "${produto}" no campo de pesquisa
    Fill Text    //input[contains(@type,'text')]    ${produto}

Clicar no botão de pesquisa
    Click    //input[contains(@type,'submit')]

Verificar o resultado da pesquisa, listando o produto pesquisado ${produto}
    Wait For Elements State    //span[@class='a-color-state a-text-bold'][contains(.,'${produto}')]    visible

#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página aparece "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
     Verificar o resultado da pesquisa, listando o produto pesquisado "Xbox Series S"




