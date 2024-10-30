*** Settings ***
Documentation            Component that represents the popup

Library            AppiumLibrary

*** Variables ***
${ok_button}    id=android:id/button1

*** Keywords ***
Confirm Popup
    Wait Until Element Is Visible    ${ok_button}    timeout=5s
    Click Element                    ${ok_button}  