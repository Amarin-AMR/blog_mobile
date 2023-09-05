# blog_mobile

Hello this project about blog. it seem like i reddit or others applications.

In Blog mobile will include

- MVVM design plattern
- Json annotation (Make model)
- Login and Register
- connect RestAPI
- get Token (Token when login)
- Provider
- others

## Rest API for this project
For this project i use NestJs to make RestfulApi.

You can download and run on your localhost.

# https://github.com/dragonarm007/NestJs_Blog_Mobile_API/

## Getting Started
This is first version UI interface, In this version i want to show about logic and pattern
For next version will update soon 

About the API i wrote with NestJs / PosgresDB
And this schema of DB
<img width="597" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 20 56" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/41c23a7e-76fe-4a3c-baff-c9c011e6865b">

***You have to find RestAPI which suitable with schema and change it at Repository***

You have to run this command for generate the .g file at model

"flutter pub run build_runner build --delete-conflicting-outputs"


# First Page (Home Page)
Home page, Just home page did't have logic for this page (for now)
<img width="508" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 13 19" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/b0d6a1eb-c601-4866-8504-2c490b9d5935">

# Registration Page
Registration page, just register to get Id and login after that.
For the logic, When success regis that username and email not same with other. it will navigate you to home page.
(Maybe Next version can Login with gmail, facebook or others.)
<img width="508" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 04 41" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/08139a55-2331-4c4c-8b65-2e79d0e32f06">

# Login Page
Login page, use Id, uesrname password from registration to sign in. 
After that you will get access_token.
I use Shared pref for save token.
(https://pub.dev/packages/shared_preferences)
<img width="508" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 04 34" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/57af38dd-de9c-48fc-b0a7-ecdafad22209">

# Blog Page
Blog page, show all post from all user ( for now ).
I made widgets for post (it's like card for show about title, content and name)
<img width="508" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 04 10" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/4adebc3b-935e-4a1d-9c71-2a2946709c17">

# Add Post Dialog
Add Post Dialog, it's just dialog that add new post for user.
For logic, when you add new post, it's will update certainly.
<img width="508" alt="ภาพถ่ายหน้าจอ 2566-09-05 เวลา 05 04 02" src="https://github.com/dragonarm007/blog_mobile/assets/69615994/ba4c37ef-3a0f-4f89-9cbf-c7815e268c25">


