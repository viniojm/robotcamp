*** Settings ***
Documentation        Managing the mass of tests through the database

Library        DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database
    ...    psycopg2
    ...    db_name=aysfdenk
    ...    db_user=aysfdenk
    ...    db_password=45gKGXtRpr8H0xlNqNyge1qvrG0MjNwk
    ...    db_host=isabelle.db.elephantsql.com
    ...    db_port=5432
    
Select Student Where Email
    [Arguments]        ${email}
    ${query}           Set Variable
    ...                SELECT * FROM public.students WHERE email = '${email}';
        
    ${results}         Query        ${query}
    [Return]           ${results}[0]

Delete Enroll By Email
    [Arguments]        ${email}
    ${user}            Select Student Where Email    ${email}
    
    ${query}           Set Variable
    ...                DELETE FROM public.enrollments WHERE student_id = '${user}[0]';
   
    Execute Sql String    ${query}

# Helpers
Reset Student Enrolls
    [Arguments]        ${email}
    Connect To Postgres
    Delete Enroll By Email    ${email}
    Disconnect From Database