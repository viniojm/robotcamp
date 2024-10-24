*** Settings ***
Documentation      Suiete de testes de matriculas de alunos
...                Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource


*** Test Cases ***
Must enroll a student
    ${admin}      Get Fixture    admin
    ${student}    Get Fixture    student

    Reset Student Enrolls    ${student}[email]

    Do Login    ${admin}            
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date    
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso