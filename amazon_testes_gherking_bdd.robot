*** Settings ***
Documentation    Esta suite testa o site da Amazon.com.br
Resource         amazon_resources_gherkin_bdd.robot
Test Setup       Abrir O Navegador
Test Teardown    Fechar O Navegador

*** Test Cases ***
Caso de Teste #1: Acesso ao menu "Eletrônicos"
    [Documentation]    Este teste verifica o menu Mais Vendidos do site da Amazon.com.br
    ...                e verifica a categoria Eletrônicos
    [Tags]             menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Mais Vendidos"
    Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    E o texto "Mais vendidos" deve ser exibido na página
    E a categoria "Eletrônicos" deve ser exibida na página
   
Caso de Teste #2: Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Playstation 5"
    Então o título da página deve ficar "Amazon.com.br : Playstation 5"
    E um produto da linha "Playstation 5" deve ser mostrado na página

