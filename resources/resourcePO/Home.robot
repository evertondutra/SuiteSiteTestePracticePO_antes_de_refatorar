*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource.robot


*** Variables ***
${HOME_URL}                  http://automationpractice.com
${HOME_TITULO}               My Store
${HOME_FIELD_PESQUISAR}      name=search_query
${HOME_TPOMENU}              xpath=//*[@id="block_top_menu"]/ul
${HOME_PRODUCT}              xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"] 
${HOME_BTN_ADDCARD}          xpath=//*[@id="add_to_cart"]/button
${HOME_BTN_CHECKOUT}         xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
${HOME_BTN_PESQUISAR}        name=submit_search
${HOME_BTN_SIGNIN}           xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

*** Keywords ***
#### Ações
Acessar a página home do site
    Go To                            ${HOME_URL}
    Wait Until Element Is Visible    ${HOME_TPOMENU}
    Title Should Be                  ${HOME_TITULO}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          ${HOME_FIELD_PESQUISAR}      ${PRODUTO}

Clicar no botão pesquisar
    Click Element       ${HOME_BTN_PESQUISAR}

Clicar no botão "Add to Cart" do produto
    Wait Until Element Is Visible   ${HOME_PRODUCT}
    Click Element                   ${HOME_PRODUCT}
    Wait Until Element Is Visible   ${HOME_BTN_ADDCARD}
    Click Button                    ${HOME_BTN_ADDCARD}

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible   ${HOME_BTN_CHECKOUT}
    Click Element                   ${HOME_BTN_CHECKOUT}

Adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to Cart" do produto
    Clicar no botão "Proceed to checkout"

Clicar em "Sign in"
    Click Element                   ${HOME_BTN_SIGNIN}
