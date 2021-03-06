*** Settings ***
Suite Setup                   Get Test Cases
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
@{scripts_path}=              ${CURDIR}/../../scripts
@{pattern}=                   *.resc
@{excludes}=                  complex

*** Keywords ***
Get Test Cases
    Setup
    @{scripts}=  List Files In Directory Recursively  @{scripts_path}  @{pattern}  @{excludes}
    Set Suite Variable  @{scripts}

Load Script
    [Arguments]               ${path}
    Execute Script            ${path}

*** Test Cases ***
Should Load Demos
    :FOR  ${script}  IN  @{scripts}
    \	  Load Script  ${script}
    \     Reset Emulation 
	

