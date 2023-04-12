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