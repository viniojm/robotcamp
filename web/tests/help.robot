*** Settings ***
Documentation        Help request receipt test suite

Resource            ../resources/base.resource

Test Teardown        Take Screenshot

*** Tasks ***
Must receive an order for help

    ${admin}    Get Fixture    admin
    ${joao}     Get Fixture    joao

    Reset Student          ${joao}[student][email]

    ${token}              Get Service Token     ${admin}
    ${student_id}         Create New Student    ${token}    ${joao}[student]

    Post Question         ${student_id}    ${joao}[question]

    Do Login              ${admin}        
    Open Notification
    Notification Should Be    ${joao}[question]
