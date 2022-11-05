*** Settings ***
Documentation    test based on browserlibrary keywords
Library  Browser
Library  FakerLibrary

*** Variables ***
${CREATE_USER_EMAIL}  id=email_create
${CREATE_USER_BTN}  id=SubmitCreate
${USER_GENDER}  id=id_gender2
${USER_FIRSTNAME}  id=customer_firstname
${USER_LASTNAME}  id=customer_lastname
${NEW_USER_PASSWD}  id=passwd
${DOB_DAYS}  id=days
${DOB_MONTHS}  id=months
${DOB_YEARS}   id=years
${USER_ADDRESS}  id=address1
${USER_CITY}  id=city
${USER_STATE}  id=id_state
${USER_POSTCODE}  id=postcode
${USER_MOBILE}  id=phone_mobile
${ADD_ALIAS}  id=alias
${REGISTER_BTN}  xpath=//span[text() = 'Register']
${MY_ADDRESSES}  xpath=//span[text() = 'My addresses']
${NEW_ADDRESS}  xpath=//span[text() = 'Add a new address']
${SAVE_BTN}  id=submitAddress
${DELET_ADD_BTN}  xpath=//*[@id="center_column"]/div[1]/div/div[2]/ul/li[9]/a[2]/span
${LATTER_FIRSTNAME}  id=firstname
${LATTER_LASTNAME}   id=lastname

${LOGIN_USERNAME_FIELD}    id=email
${LOGIN_PASSW_FIELD}       id=passwd
${LOGIN_BTN}       id=SubmitLogin
${MYPERSNLINFO_FIELD}   xpath=//*[@id="center_column"]/div/div[1]/ul/li[4]/a/span
${CURRENTPASSWD_FIELD}     id=old_passwd
${NEWPASSWD_CHANGEPASSWD_FIELD}   id=passwd
${CONFIRMPASSWDCHANGE}    id=confirmation
${USER_EMAIL}      ininnchris@gmail.com
${USER_PASSWD}     Munachi1966
${NEWPASSWD}       munachi
${SAVE_CHANGGEPASSWD}   xpath=//*[@id="center_column"]/div/form/fieldset/div[11]/button/span





*** Keywords ***
Go to the Login Page
    New Browser  Chromium  headless=false
    New Page  http://automationpractice.com/index.php?
    #${old_timeout} =
    Click     xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    #Set Browser Timeout    ${old_timeout}


Enter email for new user and click the create account button
    ${email}=  FakerLibrary.email
    log  ${email}
    Set Test Variable    ${email}
    Fill Text  id=email_create   ${email}
    Click  id=SubmitCreate

Enter firstname, lastname and password
    [Arguments]  ${firstname}  ${lastname}  ${password}
    Fill Text   ${USER_FIRSTNAME}  ${firstname}
    Fill Text   ${USER_LASTNAME}  ${lastname}
    Fill Text   ${NEW_USER_PASSWD}  ${password}

Select user date of birth in days, months and Years
    #Sleep    5
    Select Options By   ${DOB_DAYS}   Value  10
    #Sleep    5
    Select Options By    ${DOB_MONTHS}  index  9
    #Sleep    5
    Select Options By    ${DOB_YEARS}  Value  1990

Enter latter firstname and lastname
     [Arguments]   ${firstname}   ${lastname}
     Fill Text   ${LATTER_FIRSTNAME}   ${firstname}
     Fill Text   ${LATTER_LASTNAME}   ${lastname}

Enter address, City, State, postcoode, mobile, alias and click on register

     Fill Text   ${USER_ADDRESS}  Testing street
     Fill Text  ${USER_CITY}  Chicago
     Select Options By  ${USER_STATE}  Text  Illinois
     Fill Text  ${USER_POSTCODE}  00000
     Fill Text   ${USER_MOBILE}  123456789
     Fill Text   ${ADD_ALIAS}  QA House
     Click  ${REGISTER_BTN}
     Get Text  xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a/span  ==    Lola Gold

Enter existing email and click create account button
    [Arguments]   ${email}
    Fill Text  id=email_create   ${email}
    Click  id=SubmitCreate
    Get Text    xpath=//*[@id="create_account_error"]/ol/li  ==  An account using this email address has already been registered. Please enter a valid password or request a new one.

Create a new password, enter existing email and password
     fill text  ${LOGIN_USERNAME_FIELD}     ${USER_EMAIL}
     fill text  ${LOGIN_PASSW_FIELD}        ${USER_PASSWD}
     click      ${LOGIN_BTN}
     click      ${MYPERSNLINFO_FIELD}
     fill text  ${CURRENTPASSWD_FIELD}      ${USER_PASSWD}
     fill text  ${NEWPASSWD_CHANGEPASSWD_FIELD}   ${NEWPASSWD}
     fill text  ${CONFIRMPASSWDCHANGE}     ${NEWPASSWD}
     click      ${SAVE_CHANGGEPASSWD}



Verify that password was changed successfully
    fill text  ${LOGIN_USERNAME_FIELD}     ${USER_EMAIL}
    fill text  ${LOGIN_PASSW_FIELD}         ${NEWPASSWD}
    click      ${LOGIN_BTN}

Change the password to the initial password

     fill text  ${LOGIN_USERNAME_FIELD}     ${USER_EMAIL}
     fill text  ${LOGIN_PASSW_FIELD}        ${NEWPASSWD}
     click      ${LOGIN_BTN}
     click      ${MYPERSNLINFO_FIELD}
     fill text  ${CURRENTPASSWD_FIELD}      ${NEWPASSWD}
     fill text  ${NEWPASSWD_CHANGEPASSWD_FIELD}   ${USER_PASSWD}
     fill text  ${CONFIRMPASSWDCHANGE}     ${USER_PASSWD}
     click      ${SAVE_CHANGGEPASSWD}






