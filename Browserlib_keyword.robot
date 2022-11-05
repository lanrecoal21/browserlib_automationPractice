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
${OUR_STORE}    xpath=//*[@id="block_various_links_footer"]/ul/li[4]/a
${LOCATION_FIELD}    id=addressInput
${RADIUS_SELECT}   id=radiusSelect
${CLICK_SEARCH}    xpath=//*[@id="center_column"]/div[2]/div[3]/button



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


Click Our Store on the footer and enter Location ,Radius and Search
     Click    ${OUR_STORE}
     Handle Future Dialogs    accept
     Fill Text    ${LOCATION_FIELD}    Miami
     Select Options By   ${RADIUS_SELECT}      Value   100
     Click    ${CLICK_SEARCH}
     Handle Future Dialogs    dismiss