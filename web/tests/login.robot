*** Settings ***
Documentation      Authentication Test Suite
...                Administrator must access the gym management portal

Resource    ../resources/base.resource

Test Teardown        Take Screenshot

*** Test Cases ***
Administrator Login
    Go to Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Logged In    Admin

Email not registered
    Go to Login Page
    Fill Credentials        404@smartbit.com    qacademy
    Submit Credentials
    Verify Toaster          Suas credenciais são inválidas, por favor tente novamente!
   
Incorrect password
    Go to Login Page
    Fill Credentials        admin@smartbit.com    124512
    Submit Credentials
    Verify Toaster          Suas credenciais são inválidas, por favor tente novamente!

Email in incorrect format
    Go to Login Page
    Fill Credentials        @com.br    124512
    Submit Credentials
    Field Type Should be Email

Blank password
    Go to Login Page
    Fill Credentials        admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

Black email
    Go to Login Page
    Fill Credentials        ${EMPTY}    124512
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório

Email and password are required
    Go to Login Page
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória