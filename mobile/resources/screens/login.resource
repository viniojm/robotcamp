*** Settings ***
Documentation            The file representing the login page

Library            AppiumLibrary

*** Variables ***
${API_URL}        http://192.168.15.9:3333

*** Keywords ***
Login With Student ID
    [Arguments]        ${student_id}
    
    Input Text    xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]        ${API_URL}
    Input Text    xpath=//android.widget.EditText[@text="Informe seu código de acesso"]        ${student_id}

    Click Text    Entrar