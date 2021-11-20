*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}              opera

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}

Fechar navegador
    Capture Page Screenshot
    Close Browser
