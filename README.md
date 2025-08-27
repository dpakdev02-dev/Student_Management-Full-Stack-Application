# 🎓 Student Management System

A **Java-based Student Management System** built using **Maven**, **MySQL**, and **Web Technologies (HTML, CSS, JavaScript)**.  
This project allows administrators to manage student details efficiently — including adding, updating, deleting, and viewing student records.

---

## 🚀 Features
- ➕ Add new students  
- ✏️ Update existing student information  
- ❌ Delete student records  
- 📖 View all students in a structured format  
- 🎨 Simple and responsive web interface  

---

## 🛠️ Tech Stack
- **Backend:** Java (Servlets, JDBC), Maven  
- **Frontend:** HTML, CSS, JavaScript  
- **Database:** MySQL  
- **Server:** Apache Tomcat  

---

## 📂 Project Structure
Student-Management-System/
  │── src/main/java/ # Java source files (Servlets, JDBC, Models)                                                                         
  │── src/main/webapp/ # JSP/HTML, CSS, JavaScript files                                                                                  
  │── pom.xml # Maven configuration                                                                                                       
  │── README.md # Project documentation                                                                                                   


---

## ⚙️ Setup Instructions
1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/student-management-system.git
cd student-management-system
2️⃣ Configure Database

Create a MySQL database:

CREATE DATABASE studentdb;


Create student table:

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10),
    marks DECIMAL(5,2)
);

Update database connection in DBConnection.java :

String url = "jdbc:mysql://localhost:3306/studentdb";
String username = "root";
String password = "root";

3️⃣ Build Project
mvn clean package

4️⃣ Deploy on Tomcat

Copy the generated .war file from target/ into Tomcat’s webapps/ directory.

Start Tomcat server.

Access the application at:

http://localhost:8080/student-management-system

📸 Screenshots 
<img width="1359" height="752" alt="image" src="https://github.com/user-attachments/assets/63e1a051-63c4-4214-93e6-60708d1a2565" />
<img width="1366" height="764" alt="image" src="https://github.com/user-attachments/assets/ede79838-a3c8-4fcb-9551-57ac914c88cf" />
<img width="1366" height="766" alt="image" src="https://github.com/user-attachments/assets/9a5448d5-d186-41e9-84aa-479c57e3f100" />
<img width="1364" height="763" alt="image" src="https://github.com/user-attachments/assets/c62249b4-c129-4d19-972e-38dec6f5dcbb" />



