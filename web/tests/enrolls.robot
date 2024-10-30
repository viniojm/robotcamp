*** Settings ***
Documentation      Suiete de testes de matriculas de alunos
...                Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

Test Teardown        Take Screenshot

*** Test Cases ***
Must enroll a student
    ${admin}      Get Fixture    admin
    ${falcao}    Get Fixture     falcao

    Reset Student     ${falcao}[student][email]

    ${token}      Get Service Token    ${admin}
    Create New Student    ${token}    ${falcao}[student]

    Do Login    ${admin}            
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date    
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso