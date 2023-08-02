# ElearningManagement - JEE

## General context
It is an application developed in pure JEE without framework.  It is intended for the educational world in order to manage the relations between the administration, the students and the teachers.
Each of these has a personal account with a different user space. *The code is in English but the front-end part is in French because this application is dedicated to a French school.*

## Version of tools used
TOMCAT (Application server that runs our JEE application): 10.0.26
<br />MySQL (Database):  8.0.31<br />

## Architecture
MVC : 
 ![Screenshot from 2023-08-02 14-05-58](https://github.com/SlimKhiari/ElearningManagement-JEE/assets/73532355/9331e107-8e8f-400b-9f44-637daeca7eef)

## Locations of different files
I created **4 JAVA packages**; **one for the beans** (to instantiate the course, exam, student and teacher objects), **the second DAO** (containing the implementation of the interface in order to establish the connection with the MySQL database, and the various methods having a relation with this database), the **third security** (containing the servlet to counter the XSS attack), and the last one **servlets** (containing the servlets for redirecting and uploading and downloading files).
<br />![image](https://user-images.githubusercontent.com/73532355/210252939-b43c835a-f200-4fde-8920-e8e384c2b870.png) <br/> 
These packages can be found in : **\src\main\java\com\slim**.
<br />
The **HTML pages** are in **webapp**.
<br />![image](https://user-images.githubusercontent.com/73532355/210253022-d35a236e-e6f5-46c0-9f65-df4ea159cb7c.png)
<br/>These HTML pages can be found in : **\src\main\webapp**.

## How to launch the application ?
To launch the application, simply launch the Login.java servlet.

## A few technical remarks
**Design pattern used**<br />
> The design patterns used are: MVC and DAO for more flexibility.<br />

**Database**<br />
> A database was used to store information regarding; students, teachers, files to send, students grades and their course abscences. An SQL type database was used for this.<br />
![This is an image](https://user-images.githubusercontent.com/73532355/210249899-638efd92-d5fe-4ff9-8258-5acac8c4732d.png)

**The XSS attack**<br />
> To counter this type of classic attack on web applications, I set up a dedicated servlet to remove all the tags entered by the user. For this I used 3 important regular expressions:<br />
![image](https://user-images.githubusercontent.com/73532355/210250334-513eb44e-2662-4ddc-b7b1-2036a99ed03a.png)
<br />Here is the path to the servlet responsible for this security: *\src\main\java\com\slim\security\XssFilter.java*

**Sending messages from teachers to students**
> To do this, I used an API dedicated to this : https://formsubmit.co/

**Sending files**
> I chose to store the files on the hard disk in different folders rather than on an SQL database in order to avoid overloading it.
<br />Here are the paths of the servlets allowing to upload and download the files: *\src\main\java\com\slim\servlets\UploadServlet.java* and *\src\main\java\com\slim\servlets\DownloadServlet.java*

## SQL queries
All the SQL queries of our database are in the **DATABASE** folder.

## Some screenshots of our application
Authentication page
> <br />![Screenshot 2023-01-02 172320](https://user-images.githubusercontent.com/73532355/210257237-ecbe7f80-91b9-42ce-a6e2-92893e091bbf.jpg)

Administration page
> ![image](https://user-images.githubusercontent.com/73532355/210257346-734fde6f-566d-4f56-9c73-ecb51f5759ab.png)

Student page
> ![image](https://user-images.githubusercontent.com/73532355/210508843-5e5746e5-8735-4928-a7fa-a308d9a66ea0.png)

Professor page
> ![image](https://user-images.githubusercontent.com/73532355/210508929-355e45b3-1ce2-4335-9526-77384efdc3b9.png)


