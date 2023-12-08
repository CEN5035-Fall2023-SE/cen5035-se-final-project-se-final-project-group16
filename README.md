[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ZMFqDx2I)

**Project Description**

We group-16, have developed the TA Recruitment web application using java servlets, jsp, html, bootstrap, javascript, jquery, and mySql for database. the main part or core part of the application configuration is the WEB.xml file which runs the application and redirects to the servelts with url mappings. all the ui pages (JSP - Java Server Pages) resides in the home directory of the application ex: login.jsp

**JSP Pages**

Login page has -> login.jsp
Register page -> register.jsp
TA Applicant page -> applicantHome.jsp
TA Committee page -> taCommitteeHome.jsp
Admin page -> admin.jsp
Instructor page -> instructorHome.jsp

**Java Servlets/Classes**

For Authentication Module ->    Login.java
                                Register.java
TA Applicant Module ->          ApplicantHome.java
                                ApplicationForm.java
                                ApplicationStatus.java
                                OfferAcceptReject.java
Admin Module ->                 AdminHome.java
                                AddRemoveCommittee.java
                                AddRemoveCourse.java
                                AddRemoveInstructor.java
                                RecommendApplication.java
                                SendTAOffers.java
TA Committee Module ->          TACommitteeHome.java
                                ApplicationStatus.java
Instructor Module ->            InstructorHome.java
                                AddInstructorFeedback.java

For updating the individuals profile (common class for all the users) -> ProfileUpdate.java

**Some java bean class**

ApplicationStatusBean.java
ApprovedApplicationsBean.java
CommitteeBean.java
CourseData.java
DepartmentData.java
InstructorBean.java
TaApplicationData.java
TaData.java
TaFeedbackData.java


**Application base URl** -> http://localhost:8080/TA/login.jsp

Basically applications runs with the url mappings, Let's say If I navigate to _http://localhost:8080/TA/adminHome_ first it calls the AdminHome servlet to execute the business logic and then returns the processed data to the admin.jsp page and finally user will look the jsp content (UI) along with data.

**To run this application, one should have the below requirements:**

MySql Databse
Apache Tomcat server (preffered version 9)
Java
Active internet connection

We've attached the database schema in ta.sql file, run this sql file in mysql databse server to create the ta database schema in your machine and it  contains all the tables with initial data to run the application.

NOTE: Mysql databse version should be 8.0.34 and while installing the mysql database, please use 'ta' as username and 'root' as password or else if you have already create the database credentials then update the 13th line of java servlet files, please search for the below line and replace with followed line. 

Existing line - > **Connection connObject = DriverManager.getConnection("jdbc:mysql://127.8.9.0:3306/ta", "ta", "root");**
Replace with -> **Connection connObject = DriverManager.getConnection("jdbc:mysql://localhost:3306/ta", "username", "password");**

In place username please give your database username and in place of password use your database password

After replacing the mysql database connection url, don't forgot to compile the java files.

To compile the java files use javac filename.java, for some files like AdminHome.java it requires some java bean files too to compile the AdminHome.java so if you see any java beans using in the java files pass that bean in the compiling command

Ex: AdminHome.java CourseData.java DepartmentData.Java TaApplicationData.java CommitteeBean.java InstructorBean.java Course ApprovedApplicationsBean.java

After making these changes in your local machine, you have restart the apache tomcat server to refelct these changes to our application.







                                

