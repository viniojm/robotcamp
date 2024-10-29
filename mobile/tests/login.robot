*** Settings ***
Documentation        Login test suite

Resource       ../resources/base.resource


Test Setup                      Start App
Test Teardown                   Finish App

*** Variables ***
${error_401}                    Acesso não autorizado! Entre em contato com a equipe de atendimento.

*** Test Cases ***
Must log in with successfully
    ${falcao}    Get Fixture    falcao
    
    Login With Student ID       ${falcao}[student][id]    
    Wait Until Page Contains    Olá, ${falcao}[student][name]!

Invalid student code
    Login With Student ID       9999
    Wait Until Page Contains    ${error_401}     

Negative student code
    Login With Student ID       -1
    Wait Until Page Contains    ${error_401}     

Student alphanumeric code
    Login With Student ID       abc123
    Wait Until Page Contains    ${error_401}     