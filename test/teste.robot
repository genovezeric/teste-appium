*** Settings ***
Resource    ../base.resource
Test Setup        Open App
Suite Teardown    Fechar app

*** Test Cases ***
CT001: Acessar App e preencher os dados corretamente
    [Documentation]    Esse test case é para testar o login correto
    [Tags]    teste_sucesso
    Digitar no campo de email
    Digitar no campo senha
    Clicar em "Entrar"
    Aguardar a mensagem "Acesso Liberado!"
    Tirar print da tela

CT002: Acessar app e preencher os dados errados
    [Documentation]    Esse test case é para testar o login incorreto
    [Tags]    teste_falha
    Digitar o email invalido
    Digitar a senha invalida
    Clicar em "Entrar"
    Aguardar o modal de email ou senha invalido
    Tirar print da tela