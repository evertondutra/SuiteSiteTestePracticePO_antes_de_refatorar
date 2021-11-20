*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CREATEACCOUNT_ELEMENT_GENERO}        id=id_gender2
&{CREATECCOUNT_DADOS}    name=May  
...    sobrenome=Fernandes  
...    password=123456
...    address=Rua Framework, Bairro Robot
...    city=Floripa
...    postcode=12345
...    phone_mobile=99988877
${CREATECCOUNT_BTN_REGISTER}            submitAccount
${CREATECCOUNT_INPUT_NAME}              id=customer_firstname
${CREATECCOUNT_INPUT_LASTNAME}          id=customer_lastname
${CREATECCOUNT_INPUT_PASSWORD}          id=passwd
${CREATECCOUNT_INPUT_ADDRESS1}          id=address1 
${CREATECCOUNT_INPUT_CITY}              id=city
${CREATECCOUNT_INPUT_STATE}             id=id_state
${CREATECCOUNT_INPUT_POSTCODE}          id=postcode 
${CREATECCOUNT_INPUT_PHONE_MOBILE}      id=phone_mobile
${CREATECCOUNT_INPUT_TEXT_IN_PAGE}      xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]



*** Keywords ***

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${CREATECCOUNT_INPUT_TEXT_IN_PAGE}
    Click Element                   ${CREATEACCOUNT_ELEMENT_GENERO}
    Input Text                      ${CREATECCOUNT_INPUT_NAME}             ${CREATECCOUNT_DADOS.name}
    Input Text                      ${CREATECCOUNT_INPUT_LASTNAME}         ${CREATECCOUNT_DADOS.sobrenome}
    Input Text                      ${CREATECCOUNT_INPUT_PASSWORD}         ${CREATECCOUNT_DADOS.password}
    Input Text                      ${CREATECCOUNT_INPUT_ADDRESS1}         ${CREATECCOUNT_DADOS.address}
    Input Text                      ${CREATECCOUNT_INPUT_CITY}             ${CREATECCOUNT_DADOS.city}
    Set Focus To Element            ${CREATECCOUNT_INPUT_STATE}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='opera'  Wait Until Element Is Visible   id=id_state
    Select From List By Index       ${CREATECCOUNT_INPUT_STATE}             9
    Input Text                      ${CREATECCOUNT_INPUT_POSTCODE}          ${CREATECCOUNT_DADOS.postcode}
    Input Text                      ${CREATECCOUNT_INPUT_PHONE_MOBILE}      ${CREATECCOUNT_DADOS.phone_mobile}


Submeter cadastro
    Click Button    ${CREATECCOUNT_BTN_REGISTER} 