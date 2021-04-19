*** Settings ***
Library  AppiumLibrary
*** Variables ***
${NEW-NAVBAR}   xpath=//XCUIElementTypeStaticText[@name="New"]
${ADD-BUTTON}   xpath=//XCUIElementTypeButton[@name="Add"]
${APPLICATION-NAME-INPUT-FIELD}   xpath=//XCUIElementTypeApplication[@name="Passwords"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]
${USERNAME-INPUT-FIELD}   xpath=//XCUIElementTypeApplication[@name="Passwords"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther
${PASSWORD-INPUT-FIELD}   xpath=//XCUIElementTypeApplication[@name="Passwords"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]
${SAVE-BUTTON}   xpath=//XCUIElementTypeButton[@name="Save"]
${FIRST-ITEM}   xpath=//XCUIElementTypeApplication[@name="Passwords"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeOther[2]/XCUIElementTypeOther
${FIRST-ITEM-TITILE}  xpath=//XCUIElementTypeStaticText[@name="GGUIGIU"]
${BACK-TO-APPLICATION-BUTTON}  xpath=//XCUIElementTypeButton[@name="Applications"]
${DELETE-BUTTON}   xpath=//XCUIElementTypeButton[@name="Delete"]
${SECOND-ITEM}   id:
*** Test Cases ***

Add New Password

   open application  http://localhost:4723/wd/hub    platformName=iOS   deviceName=iPhone 12 Pro   automationName=XCUITest  app=//Users//trinhtran//Desktop//Passwords.app
   wait until page contains element  ${add-button}
   click element  ${add-button}
   page should contain element  ${new-navbar}
   input text  ${application-name-input-field}   Github
   input text  ${username-input-field}    bigsugar
   input text  ${PASSWORD-INPUT-FIELD}   123456
   page should contain element   ${save-button}
   click element  ${save-button}
   wait until page contains element   ${FIRST-ITEM}

Check First Item Content

   click element  ${first-item}
   wait until page contains   bigsugar
   click element  ${back-to-application-button}

Add Second Item

   click element  ${add-button}
   page should contain element  ${new-navbar}
   input text  ${application-name-input-field}   Stack Overflow
   input text  ${username-input-field}    robotcool
   input text  ${PASSWORD-INPUT-FIELD}   123456
   page should contain element   ${save-button}
   click element  ${save-button}

Suite Teardown     Close Application