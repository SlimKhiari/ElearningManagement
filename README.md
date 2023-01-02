# ElearningManagement - JEE

## General context
> It is an application developed in pure JEE without framework.  It is intended for the educational world in order to manage the relations between the administration, the students and the teachers.
Each of these has a personal account with a different user space. *The code is in English but the front-end part is in French because this application is dedicated to a French school.*

## Version of tools used
<br />TOMCAT (Application server that runs our JEE application): 10.0.26<br />
<br />MySQL (Database):  8.0.31<br />

## Locations of different files
I created **4 JAVA packages**; **one for the beans** (to instantiate the course, exam, student and teacher objects), **the second DAO** (containing the implementation of the interface in order to establish the connection with the MySQL database, and the various methods having a relation with this database), the **third security** (containing the servlet to counter the XSS attack), and **servlets** (containing the servlets for redirecting and uploading and downloading files).
<br />![image](https://user-images.githubusercontent.com/73532355/210252939-b43c835a-f200-4fde-8920-e8e384c2b870.png) <br/> 
These packages can be found in : **\src\main\java\com\slim**.
<br />
The HTML pages are in **webapp**.
<br />![image](https://user-images.githubusercontent.com/73532355/210253022-d35a236e-e6f5-46c0-9f65-df4ea159cb7c.png)
<br/>These HTM pages can be found in : **\src\main\webapp**.

## How to launch the applicatio ?
To launch the application, simply launch the Login.java servlet.

## A few technical remarks

**Design pattern used**
> The design patterns used are: MVC and DAO for more flexibility.

**Database**
> A database was used to store information regarding; students, teachers, files to send, students grades and their course abscences. An SQL type database was used for this.<br />
![This is an image](https://user-images.githubusercontent.com/73532355/210249899-638efd92-d5fe-4ff9-8258-5acac8c4732d.png)

**The XSS attack**
> To counter this type of classic attack on web applications, I set up a dedicated servlet to remove all the tags entered by the user. For this I used 3 important regular expressions:<br />
![image](https://user-images.githubusercontent.com/73532355/210250334-513eb44e-2662-4ddc-b7b1-2036a99ed03a.png)
<br />Here is the path to the servlet responsible for this security: *\src\main\java\com\slim\security\XssFilter.java*

**Sending messages from teachers to students**
> To do this, I used an API dedicated to this : https://formsubmit.co/

**Sending files**
> I chose to store the files on the hard disk in different folders rather than on an SQL database in order to avoid overloading it.
<br />Here are the paths of the servlets allowing to upload and download the files: *\src\main\java\com\slim\servlets\UploadServlet.java* and *\src\main\java\com\slim\servlets\DownloadServlet.java*

