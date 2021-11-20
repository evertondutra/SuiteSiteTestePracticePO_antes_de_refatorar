*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MYACCOUNT_MSG}            xpath=//*[@id="center_column"]/p
${MYACCOUNT_MSG_NAME}       xpath=//*[@id="header"]/div[2]//div[1]/a/span    May Fernandes


*** Keywords ***

#### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${MYACCOUNT_MSG}
    Element Text Should Be           ${MYACCOUNT_MSG}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${MYACCOUNT_MSG_NAME}
