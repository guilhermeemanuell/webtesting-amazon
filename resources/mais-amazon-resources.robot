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

Digitar o nome de produto "${produto}" no campo de pesquisa
    Fill Text    //input[contains(@type,'text')]    ${produto}

Clicar no botão de pesquisa
    Click    //input[contains(@type,'submit')]

Verificar o resultado da pesquisa se está listando o produto "${produto}"
    Wait For Elements State    //span[@class='a-color-state a-text-bold'][contains(.,'${produto}')]    visible

Adicionar o produto "Controle Xbox Series S" no carrinho
    Click                      //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Controle sem Fio Xbox - Robot Branco')]
    Wait For Elements State    //input[contains(@name,'submit.add-to-cart')]    visible
    Click                      //input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Controle Xbox Series S" foi adicionado com sucesso
    Wait For Elements State    //a[contains(@data-csa-c-type,'button')]    visible
    Click                      //a[contains(@data-csa-c-type,'button')]
    Wait For Elements State    //span[@class='a-truncate-cut'][contains(.,'Controle sem Fio Xbox - Robot Branco')]    visible

Remover o produto "Controle Xbox Series S" do carrinho
    Click    //input[@value='Excluir']

Verificar se o carrinho fica vazio
    Wait For Elements State    //div[contains(@data-action,'delete')]    visible




