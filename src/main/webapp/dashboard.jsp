<!-- add Students done partially continue and finish this? -->


<!DOCTYPE html>
<%@page import="dao.UsersDAO"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<style>
* {
	padding: 0%;
	margin: 0%;
	box-sizing: border-box;
}

.container {
	height: 100vh;
	width: 100vw;
	display: flex;
}

nav {
	width: 20%;
	background-color: rgb(21, 0, 50);
	height: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	gap: 50px;
}

.card {
	height: 100%;
	width: calc(100vw - 20%);
	background-image: url("./CardBg.jpg");
	background-size: cover;
	flex-direction: column;
	display: flex;
	align-items: center;
	justify-content: center;
}

h1 {
	color: aliceblue;
	text-shadow: 1.5px 1.5px 2px rgb(123, 123, 123);
}

ul {
	height: 300px;
	width: 30%;
	display: flex;
	gap: 10px;
	flex-direction: column;
	font-size: larger;
	color: white;
	font-weight: bolder;
}

li {
	list-style: none;
	letter-spacing: 2px;
}

.active {
	color: rgb(27, 94, 239);
}

li:hover {
	color: blueviolet;
}

table {
	width: 100%;
	border-radius: 10px;
	background-color: grey;
}

th {
	background-color: #000957;
	height: 30px;
	color: white;
	text-transform: uppercase;
}

td {
	height: 30px;
}

.content {
	width: 70%;
	height: 60%;
	border-radius: 10px;
	overflow: auto;
}

::-webkit-scrollbar {
	border-radius: 10px;
	height: auto;
	background-color: white;
	width: 10px;
}

::-webkit-scrollbar-thumb {
	background-image: linear-gradient(to right, rgb(55, 54, 54),
		rgb(35, 35, 35));
	border-radius: 10px;
}

tr:nth-child(n) {
	background-color: aqua;
}

tr:nth-child(2n) {
	background-color: aquamarine;
}

form {
	width: 30%;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	position: absolute;
	bottom: 20px;
	height: 30px;
}

.addbtn, .removebtn {
	height: 100%;
	border-radius: 5px;
	border: 1px solid grey;
	width: 25%;
	background-color: #0046FF;
	color: white;
	font-weight: bold;
	font-size: small;
	text-shadow: 1px 1px 2px grey;
	transition: all 0.3s ease-in-out;
	display: flex;
	flex-wrap: wrap;
}

#Box {
	height: 70%;
	width: 25%;
	position: absolute;
	background-color: aliceblue;
	border-radius: 10px;
	bottom: 0%;
	right: 0%;
	display: none;
}

#Box>h1 {
	color: black;
	position: absolute;
	right: 3%;
	font-size: large;
	cursor: pointer;
}

.addForm {
	position: absolute;
	display: none;
	flex-direction: column;
	height: 80%;
	width: 100%;
}

#add:hover {
	background-color: green;
}

#remove:hover {
	background-color: red;
}

.addForm>input {
	height: 30px;
	width: 70%;
	border: 1px solid grey;
	border-radius: 10px;
	text-align: center;
}

.btns {
	width: 70%;
	height: 30px;
	display: flex;
	justify-content: space-around;
}

td{
	text-align: center;
}

.btns>input {
	height: 100%;
	width: 30%;
	color: white;
	border: 1px solid grey;
	font-weight: bolder;
	border-radius: 5px;
}

.addOk {
	background-color: green;
}

.DeleteOk {
	background-color: red;
}

.removeForm {
	display: none;
	width: 100%;
	flex-direction: column;
	gap: 10px;
	position: absolute;
	top: 25%;
	height: 60%;
}

#DeleteInp {
	height: 30px;
	width: 70%;
	text-align: center;
	border: 1px solid grey;
	border-radius: 10px;
}

.card>p{
	marin-top:20px;
	font-size: 2em;
	color: red;
	text-shadow: 1px 1px 2px black;
}

#deletebtn {
	width: 30%;
	height: 30px;
	border-radius: 5px;
	border: 1px solid grey;
	background-color: red;
	color: white;
	font-size: medium;
	font-weight: bolder;
}
</style>
<% String err=(String) session.getAttribute("LoginSuccessful");
	if(err==null||session==null){
		response.sendRedirect("index.jsp");
	}
%>
</head>

<body>
	<div class="container">
		<nav>
			<h1>MENU</h1>
			<ul>
				<li class="active">Students</li>
				<li>Teachers</li>
				<li>Books</li>
				<li>Contact</li>
			</ul>
		</nav>
		<div class="card">
			<div id="Box">
				<h1 id="close">X</h1>
				<div class="addCard">
					<div class="add">
						<form class="addForm" action="addRow" method="get">
							<input type="text" name="id" placeholder="Enter Id" required id="addId">
							<input type="text" name="name" placeholder="Enter Name" required id="addName">
							<input type="text" name="marks" placeholder="Enter Marks"
								required id="addMarks"> 
							<input type="text" name="contact" placeholder="Enter Contact" required id="addContact"><input type="text"
								name="gender" placeholder="Enter Gender" required id="addGender">
							<div class="btns">
								<input type="submit" value="Add" class="addOk"> <input
									type="submit" value="Reset" id="rstbtn" class="DeleteOk">
							</div>
						</form>
					</div>
					<div class="remove">
						<form action="deleteData" class="removeForm" method="get">
							<input type="text" name="id" placeholder="Enter Id to Delete"
								id="DeleteInp"> <input type="submit" value="Delete"
								id="deletebtn">
						</form>
						
						
					</div>
				</div>
			</div>
			<div class="content">
				<table>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Marks</th>
						<th>Contact</th>
						<th>Gender</th>
					</tr>
					<%
					if(session!=null){
					
					ResultSet rs=(ResultSet) request.getAttribute("Display");
					
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt("id") %></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getInt("marks") %></td>
						<td><%=rs.getLong("contact") %></td>
						<td><%=rs.getString("gender") %></td>
					</tr>
					<%
					}
					}
					%>
				</table>
			</div>
			<%String status=(String)request.getAttribute("DeletedStatus");
						
						if(status!=null){
						%>
						
						<p><%= status %></p>
						
						<%} %>
						
			<form>
				<input class="addbtn" type="submit" value="Add Student" id="add">
				<input class="removebtn" type="submit" value="Delete Data"
					id="remove">
			</form>
		</div>
	</div>
	<script>
        let addbtn = document.getElementById("add");
        let removebtn = document.getElementById("remove");
        let box = document.getElementById("Box");
        let addCard=document.getElementsByClassName("addForm")[0];
        let removeForm=document.getElementsByClassName("removeForm")[0];
        

        addbtn.addEventListener("click", (e) => {
            e.preventDefault();
            box.style.display = "flex";
            removeForm.style.display="none";
            addCard.style.display="flex";
        })
        removebtn.addEventListener("click", (e) => {
            addCard.style.display="none";
            e.preventDefault();
            box.style.display = "flex";
            removeForm.style.display="flex";
        })
        
        
        let closebtn = document.getElementById("close");
        closebtn.addEventListener("click", (e) => {
            e.preventDefault();
            box.style.display = "none";
            console.log("add btn");
        })
        
        let id=document.getElementById("addId");
        let user=document.getElementById("addName");
        let marks=document.getElementById("addMarks");
        let gender=document.getElementById("addGender");
        let contact=document.getElementById("addContact");

        let rst=document.getElementById("rstbtn");

        rst.addEventListener("click",(e)=>{
        	e.preventDefault();
            id.value="";
            user.value="";
            marks.value="";
            gender.value="";
            contact.value="";
        })




    </script>
</body>

</html>