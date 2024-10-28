*** Settings ***
Documentation        Example Robot + Appium

Library        AppiumLibrary

*** Test Cases ***
Must open the SmartBit app
    Open Application	http://localhost:4723/wd/hub	
    ...	                alias=Smartbit	
    ...	                automationName=UiAutomator2
    ...	                platformName=Android	
    ...	                deviceName='Android Simulator'	
    ...	                app=${EXECDIR}/app/smartbit-beta.apk
    ...	                udid=emulator-5554
    ...	                autoGrantPermissions=true

    Sleep    5

    Close Application