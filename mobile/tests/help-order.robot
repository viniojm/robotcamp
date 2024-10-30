*** Settings ***
Documentation         Help request test suite

Resource       ../resources/base.resource
Resource    ../resources/services/enrolls.resource
Resource    ../resources/screens/components/popup.resource

Test Setup                      Start App
Test Teardown                   Finish App
Library    Browser

*** Test Cases ***
Bust be able to request help
    ${admin}        Get Fixture        admin
    ${jerry}        Get Fixture        jerry
    
    Reset Student            ${jerry}[student][email]

    ${token}                 Get Service Token        ${admin}
    ${student_id}            Create New Student       ${token}    ${jerry}[student]
    Create New Enroll        ${token}                 ${student_id}

    Login With Student ID            ${student_id}
    Confirm Popup  
    Go To Help Order
    Submit Help Order                ${jerry}[help]
    Wait Until Page Contains         Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.