*** Settings ***
Documentation        Consuming the students route of the Rest API

Library        RequestsLibrary
Resource    ../base.resource

*** Keywords ***
Create New Student
    [Arguments]     ${token}            ${student}

    ${headers}      Create Dictionary   Authorization=${token}

    ${response}     POST                http://localhost:3333/students
    ...                                 json=${student}
    ...                                 headers=${headers}
    ...                                 expected_status=201
