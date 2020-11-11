*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing
*** Variables ***
${URL}         https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}          0


*** Keywords ***
Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
 
Login
    [Arguments]     ${username}     ${password}
    Wait Until Page Contains Element    id=user-name
    Input Text      id=user-name        ${username}
    Input Text      id=password         ${password}
    Click Element   id=login-button
    Wait Until Page Contains    Products

Add Product
    [Arguments]     ${product}
    Wait Until Page Contains        xpath=//div[@class='inventory_item' and(contains(.,${product}))]//button


*** Test Cases ***
Test
    Prepare Browser
    Login  standard_user  secret_sauce
    Add Product     jacket


