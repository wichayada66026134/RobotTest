*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser    https://automationexercise.com/products    Chrome
Suite Teardown      Close Browser

*** Variables ***
${SEARCH_TEXT}      Frozen

*** Keywords ***
Input Search Product
    [Arguments]    ${SEARCH_TEXT} 
    Input Text    //*[@id="search_product"]    ${SEARCH_TEXT}
    Click Button  //*[@id="submit_search"]

Verify Search Result
    Wait Until Element Is Visible    //div[@class="features_items"]    timeout=5s
    Page Should Contain    ${SEARCH_TEXT}

*** Test Cases ***
Search and Verify Product
    Input Search Product    ${SEARCH_TEXT}
    Verify Search Result
