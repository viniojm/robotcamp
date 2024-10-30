*** Settings ***
Documentation            The file representing the help page

Library            AppiumLibrary

*** Variables ***
${help_button}        xpath=//android.widget.TextView[@text="Enviar dúvida"]
${help_text}          xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]

*** Keywords ***
Submit Help Order
    [Arguments]                      ${text}

    Wait Until Element Is Visible    ${help_button}    timeout=5s
    Click Element                    ${help_button}

    Wait Until Element Is Visible    ${help_text}    timeout=5s 
    Input Text                       ${help_text}    ${text}    
    Click Text                       Enviar    