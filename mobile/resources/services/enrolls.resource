*** Settings ***
Documentation        Consuming the enrollments route of the Rest API

Library        RequestsLibrary
Library        DateTime
Resource       ../base.resource

*** Keywords ***
Create New Enroll
    [Arguments]     ${token}            ${student_id}

    ${headers}      Create Dictionary   Authorization=${token}

    ${start_date}    Get Current Date

    ${enroll}       Create Dictionary
    ...             start_date=${start_date}
    ...             plan_id=1
    ...             student_id=${student_id}

    ${response}     POST                http://localhost:3333/enrollments
    ...                                 json=${enroll}
    ...                                 headers=${headers}
    ...                                 expected_status=201
