*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                       chrome
${URL}                           https://www.amazon.com.br/
${MENU_MAIS_VENDIDOS}            //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${MENU_LOGO_AMAZON}              nav-logo-sprites
${HEADER_MAIS_VENDIDOS}          //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]
${INPUT_PESQUISA_HOMEPAGE}       twotabsearchtextbox
${BOTAO_PESQUISA_HOMEPAGE}       nav-search-submit-button

*** Keywords ***
Abrir O Navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar O Navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    ${MENU_LOGO_AMAZON}

Entrar no menu "Mais Vendidos"
    Click Element    ${MENU_MAIS_VENDIDOS}

Verificar se aparece a frase "${TEXTO_HEADER_MAIS VENDIDOS}"
    Wait Until Page Contains    text=${TEXTO_HEADER_MAIS VENDIDOS}
    Wait Until Element Is Visible    ${HEADER_MAIS_VENDIDOS}

Verificar se o título da página fica "${TEXTO_TITULO_MAIS VENDIDOS}"
    Title Should Be    title=${TEXTO_TITULO_MAIS VENDIDOS}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//div[@role='treeitem'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=${INPUT_PESQUISA_HOMEPAGE}   text=${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${BOTAO_PESQUISA_HOMEPAGE}

Verificar o resultado da pesquisa se está listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${NOME_PRODUTO}')]

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Mais Vendidos"
    Entrar no menu "Mais Vendidos"

E o texto "Mais vendidos" deve ser exibido na página
    Verificar se aparece a frase "Mais vendidos"

Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"

E a categoria "Eletrônicos" deve ser exibida na página
    Verificar se aparece a categoria "Eletrônicos"

Quando pesquisar pelo produto "Playstation 5"
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Playstation 5"
    Verificar se o título da página fica "Amazon.com.br : Playstation 5"

E um produto da linha "Playstation 5" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Playstation 5"

Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])
    Click Element    locator=(//span[contains(.,'${NOME_PRODUTO}')])
    Wait Until Element Is Visible    locator=landingImage
    
    