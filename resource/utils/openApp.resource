*** Settings ***
Resource    ../../base.resource

*** Variables ***
${INPUT_EMAIL}      input-email
${EMAIL}            eric.genovez@britania.com.br
${INPUT_SENHA}      xpath=//android.widget.EditText[@resource-id="input-password"]
${SENHA}            123
${BUTTON_ENTRAR}    xpath=//android.view.ViewGroup[@content-desc="Entrar"]
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
    Sleep    2s
    Capture Page Screenshot