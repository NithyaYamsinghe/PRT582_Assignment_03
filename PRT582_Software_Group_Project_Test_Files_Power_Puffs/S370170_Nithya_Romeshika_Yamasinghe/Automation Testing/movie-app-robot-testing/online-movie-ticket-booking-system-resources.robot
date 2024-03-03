*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${SiteUrl}      http://127.0.0.1:8000/admin/login/
${Browser}      Chrome
${Password}     abc@123
${Username}     nithyayamasinghemovies@gmail.com


*** Keywords ***
Open Website
    [Documentation]    This verify that user is able to open the correct URL
    Set Selenium Speed    0.5 second
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
    Title Should Be    Log in | Django site admin

Input Username
    [Arguments]    ${Username}
    Input Text    username    ${Username}

Input Email
    [Arguments]    ${Username}
    Input Text    email    ${Username}

Input User Password
    [Arguments]    ${Password}
    Input Text    password    ${Password}

Click Admin Sign In
    Click Button    Log in
    Page Should Contain    Site administration

View Movies
    Click Link    Movies
    Page Should Contain    Select movie to change

Create New Movie Entry
    Click Link    Add movie
    Page Should Contain    Add movie

Enter Movie Information and Save
    Create Movie Information and Save
    ...    Oppenheimer
    ...    Cilian Murphy
    ...    Christopher Nolan
    ...    English
    ...    120
    ...    U
    ...    9
    ...    https://www.youtube.com/watch?v=uYPbbksJxIg
    ...    C:/Users/Nithya \Yamasinghe/Downloads/online-movie-ticket-booking-system-automated-testing/oppenheimerhd.jpg
    Page Should Contain    Select movie to change

Create Movie Information and Save
    [Arguments]
    ...    ${Name}
    ...    ${Cast}
    ...    ${Director}
    ...    ${Language}
    ...    ${Run Length}
    ...    ${Certficate}
    ...    ${Popularity Index}
    ...    ${Trailer}
    ...    ${Image}
    Input Text    name    ${Name}
    Input Text    cast    ${Cast}
    Input Text    director    ${Director}
    Select From List By Label    language    ${Language}
    Input Text    run_length    ${Run Length}
    Select From List By Label    certificate    ${Certficate}
    Input Text    popularity_index    ${Popularity Index}
    Input Text    trailer    ${Trailer}
    Choose File    image    ${Image}
    Click Button    Save

Change Existing Movie Details
    Click Link    Oppenheimer
    Page Should Contain    Change movie

Update Movie Information and Save
    Create Movie Information and Save
    ...    Oppenheimer
    ...    Cilian Murphy, Emily Blunt
    ...    Christopher Nolan
    ...    English
    ...    120
    ...    U
    ...    10
    ...    https://www.youtube.com/watch?v=uYPbbksJxIg
    ...    C:/Users/Nithya \Yamasinghe/Downloads/online-movie-ticket-booking-system-automated-testing/oppenheimerhd.jpg

Remove Existing Movie
    Select Checkbox    //*[@id="result_list"]/tbody/tr[1]/td/input
    Select From List By Label    action    Delete selected movies
    Click Button    Go
    Page Should Contain    Are you sure?
    Click Button    Yes, I'm sure
    Page Should Contain    Select movie to change

Go to Home Page
    Click Link    Home

View Users
    Click Link    Users

Create New User Entry
    Click Link    Add user
    Page Should Contain    Add user

Enter User Information and Save
    Create User Information and Save
    ...    S370170nithya@gmail.com
    ...    abc@12
    ...    abc@12
    Page Should Contain    Select user to change

Create user Information and Save
    [Arguments]
    ...    ${Email}
    ...    ${User Password}
    ...    ${Password Confirmation}
    Input Text    email    ${Email}
    Input Text    password1    ${User Password}
    Input Text    password2    ${Password Confirmation}
    Click Button    Save
    Page Should Contain    Change user
    Select Checkbox    //*[@id="id_active"]
    Select Checkbox    //*[@id="id_staff"]
    Click Button    Save
    Page Should Contain    Select user to change

Change Existing User Details
    Click Link    S370170nithya@gmail.com
    Page Should Contain    Change user

Update User Information and Save
    Create Update User Information and Save
    ...    S370170nithya2@gmail.com

Create Update User Information and Save
    [Arguments]
    ...    ${Email}
    Input Text    email    ${Email}
    Select Checkbox    //*[@id="id_active"]
    Select Checkbox    //*[@id="id_staff"]
    Select Checkbox    //*[@id="id_admin"]
    Click Button    Save

Remove Existing User
    Select Checkbox    //*[@id="result_list"]/tbody/tr[3]/td[1]/input
    Select From List By Label    action    Delete selected users
    Click Button    Go
    Page Should Contain    Are you sure?
    Click Button    Yes, I'm sure
    Page Should Contain    Select user to change

Admin User Log out
    Click Link    Log out

Regular User Sign In
    Click Link    Sign In

Click User Sign In
    Click Button    login
    Page Should Contain    BoxOffice

User Movies Screen
    Click Link    Movies
    Input Text    q    opp
    Click Button    Search
