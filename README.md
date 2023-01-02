# ElearningManagement

## General context
> It is an application developed in pure JEE without framework.  It is intended for the educational world in order to manage the relations between the administration, the students and the teachers.
Each of these has a personal account with a different user space. *The code is in English but the front-end part is in French because this application is dedicated to a French school.*

## A few technical remarks

**Design pattern used**
> The design patterns used are: MVC and DAO for more flexibility.

#**Database**
> A database was used to store information regarding; students, teachers, files to send, students grades and their course abscences. An SQL type database was used for this.<br />
![This is an image](https://user-images.githubusercontent.com/73532355/210249899-638efd92-d5fe-4ff9-8258-5acac8c4732d.png)

**The XSS attack**
> To counter this type of classic attack on web applications, I set up a dedicated servlet to remove all the tags entered by the user. For this I used 3 important regular expressions:<br />
![image](https://user-images.githubusercontent.com/73532355/210250334-513eb44e-2662-4ddc-b7b1-2036a99ed03a.png)
Here is the path to the servlet responsible for this security: *\src\main\java\com\slim\security\XssFilter.java*

**Sending messages from teachers to students**
> To do this, I used an API dedicated to this : https://formsubmit.co/

