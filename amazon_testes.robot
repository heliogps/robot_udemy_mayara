*** Settings ***
Documentation    Esta suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir O Navegador
Test Teardown    Fechar O Navegador

*** Test Cases ***
Caso de Teste #1: Acesso ao menu "Eletrônicos"
    [Documentation]    Este teste verifica o menu Mais Vendidos do site da Amazon.com.br
    ...                e verifica a categoria Eletrônicos
    [Tags]             menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Mais Vendidos"
    Verificar se aparece a frase "Mais vendidos"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece a categoria "Eletrônicos"
    Verificar se aparece a categoria "Esporte"
Caso de Teste #2: Pesquisa de um Produto
    [Documentation]    Este teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Playstation 5"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Playstation 5"
    Adicionar o produto "Playstation 5" no carrinho
    Verificar se o produto "Playstation 5" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Playstation 5"
    Adicionar o produto "Playstation 5" no carrinho
    Verificar se o produto "Playstation 5" foi adicionado com sucesso
    Remover o produto "Playstation 5" do carrinho
    Verificar se o carrinho fica vazio