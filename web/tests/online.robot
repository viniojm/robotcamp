*** Settings ***
Documentation        Check if the application is online

Library   Browser

Test Teardown        Take Screenshot

*** Test Cases ***
Portal Admin deve estar online
    New Browser    headless=False    browser=chromium
    New Page    http://localhost:3000/
    Get Text    h1    contains    Painel do Administrador
    Sleep    1