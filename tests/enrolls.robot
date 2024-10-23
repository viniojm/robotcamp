*** Settings ***
Documentation      Suiete de testes de matriculas de alunos
...                Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Must enroll a student
    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Do Login    ${admin}            
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    Falcão
    Select Plan       Smart
    Fill Start Date    


    Sleep    5