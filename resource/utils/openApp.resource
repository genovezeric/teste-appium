*** Settings ***
Resource    ../../base.resource

*** Variables ***
${INPUT_EMAIL}      input-email
${EMAIL}            eric.genovez@britania.com.br
${INPUT_SENHA}      xpath=//android.widget.EditText[@resource-id="input-password"]
${SENHA}            123
${BUTTON_ENTRAR}    xpath=//android.view.ViewGroup[@content-desc="Entrar"]
${MSG_CONFIRM}      xpath=//android.widget.TextView[@text="Acesso Liberado!"]
${MSG_MODAL}        com.britania_eric.maestroapp:id/alertTitle

*** Keywords ***
Open App
    
    Open Application    
    ...    remote_url=http://localhost:4723/wd/hub
    ...    automationName=UIAutomator2
    ...    platformName=android
    ...    deviceName=23122PCD1G
    ...    appPackage=com.britania_eric.maestroapp
    ...    appActivity=.MainActivity
    ...    noReset=${True}
    ...    disableIdLocatorAutocompletion=${True}     ### Serve para desabilitar o autocomplete de ID (Recomendado em caso de uso de ids);
    Wait Until Element Is Visible    ${INPUT_EMAIL}

Digitar no campo de email
    Input Text    ${INPUT_EMAIL}    ${EMAIL}

Digitar no campo senha
    Input Text    ${INPUT_SENHA}    ${SENHA}

Clicar em "Entrar"
    Sleep    2s
    Click Element    ${BUTTON_ENTRAR}
Aguardar a mensagem "Acesso Liberado!"
    Wait Until Element Is Visible    ${MSG_CONFIRM}    5s

Tirar print da tela
    Capture Page Screenshot

Digitar o email invalido
    ${EMAIL_INVALIDO}    FakerLibrary.Email
    Input Text    ${INPUT_EMAIL}    ${EMAIL_INVALIDO}
    Log    ${EMAIL_INVALIDO}
Digitar a senha invalida
    ${SENHA_INVALIDA}    FakerLibrary.Random Number    5
    Input Text    ${INPUT_SENHA}    ${SENHA_INVALIDA}
    Log    ${SENHA_INVALIDA}

Aguardar o modal de email ou senha invalido
    Wait Until Element Is Visible    id=${MSG_MODAL}    5s

Fechar app
    Terminate Application    app_id=com.britania_eric.maestroapp