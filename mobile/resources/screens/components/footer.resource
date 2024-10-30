*** Settings ***
Documentation            Component that represents the footer

Library            AppiumLibrary

*** Variables ***
${ho_button}    xpath=//android.widget.TextView[@text="Pedir ajuda"]

*** Keywords ***
Go To Help Order
    Wait Until Element Is Visible    ${ho_button}    timeout=5s
    Click Element                    ${ho_button}