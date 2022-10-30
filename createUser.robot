*** Settings ***
Documentation    test based on browserlibrary keywords
Library  Browser
Resource  Browserlib_keyword.robot

*** Test Cases ***
Create new account
     Set Browser Timeout    30 seconds
     Go to the Login Page
     Enter email for new user and click the create account button
     Enter firstname, lastname and password  Lola  Gold  testing
     Select user date of birth in days, months and Years
     Enter latter firstname and lastname  Lola  Gold
     Enter address, City, State, postcoode, mobile, alias and click on register

Existing email should not be able to creat an account
    [Tags]  ola
    Go to the Login Page
    Enter existing email and click create account button   lanre_april@gmail.com
