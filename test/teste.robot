*** Settings ***
Resource    ../base.resource
Suite Teardown    Close All Applications

*** Test Cases ***
CT001: Acessar App e preencher os dados corretamente
    Open App
    Digitar no campo de email
    Digitar no campo senha
    Clicar em "Entrar"