*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    online-movie-ticket-booking-system-resources.robot


*** Test Cases ***
Go to Website
    Open Website

Admin Sign In
    Input Username    ${Username}
    Input User Password    ${Password}
    Click Admin Sign In

View Movies List
    View Movies

Add New Movie
    Create New Movie Entry
    Enter Movie Information and Save

Update Existing Movie
    Change Existing Movie Details
    Update Movie Information and Save
    Page Should Contain    Select movie to change

Delete Existing Movie
    Remove Existing Movie

Add New Movie Again
    Create New Movie Entry
    Enter Movie Information and Save

Go to Home
    Go to Home Page

View Users List
    View Users

Add New User
    Create New User Entry
    Enter User Information and Save

Update Existing User
    Change Existing User Details
    Update User Information and Save
    Page Should Contain    Select user to change

Delete Existing User
    Remove Existing User

Add New User Again
    Create New User Entry
    Enter User Information and Save

Go to Home Again
    Go to Home Page

Admin Logout
    Admin User Log out

Regular User Sign In
    Regular User Sign In
    Input Email    ${Username}
    Input User Password    ${Password}

Search User Movies Screen
    User Movies Screen

Go to Home Page Again
    Go to Home Page
