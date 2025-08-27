<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login-SM Software</title>
    <style>
        * {
            padding: 0%;
            margin: 0%;
            box-sizing: border-box;
        }

        .container {
            height: 100vh;
            width: 100%;
            background-image: url("./bg.jpg");
            background-size: cover;
            display: flex;
            flex-direction:column;
            justify-content: center;
            align-items: center;

            backdrop-filter: blur(30px);

        }

        .card {
            height: 60%;
            width: 25%;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background: rgba(118, 118, 118, 0);
            border-radius: 10px;
            background-color: rgba(66, 66, 66, 0.2);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(199, 199, 199, 0.3);
            color: white;
        }

        a {
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }

        .box2 {
            width: 80%;
            display: flex;
            justify-content: space-around;
            text-shadow: 2px 2px 3px black;

        }

        form {
            height: 80%;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .card h1 {
            font-weight: bolder;
            text-shadow: 2px 2px 3px black;
            margin: 10px;
        }

        input {
            height: 35px;
            width: 80%;
            margin: 10px;
            border-radius: 40px;
            border: 1px solid rgba(136, 135, 135, 0.9);
            text-align: center;
            font-size: medium;
            font-weight: bolder;
            background-color: rgba(129, 129, 129, 0.2);
            text-shadow: 1.2px 1.2px 3px black;
            transition: all 0.3s linear;
        }


        #inp:focus {
            transform: translateY(-5px);
            color: rgb(215, 215, 215);
            font-weight: bolder;
        }

        #inp::placeholder {
            color: white;
            text-shadow: 1px 1px 1px rgb(47, 47, 47);
        }



        #btn {
            border: none;
            font-size: medium;
            color: white;
            font-weight: bolder;
            background-color: rgb(0, 72, 255);
        }
    </style>
</head>

<body>

	
    <div class="container">
    	<% String msg=(String) request.getAttribute("LoginFailed");
    		
    		if(msg!=null){
    	%>
    	
    	<h1 style="color:red"><%=msg %></h1>
    	
    	<% } %>
        <div class="card">
            <form action="login" method="get">
                <h1>Login</h1>
                <input id="inp" type="text" name="username" placeholder="Username" required="required">
                <input id="inp" type="password" name="password" placeholder="Password" required="required">
                <input type="submit" value="Login" id="btn">
            </form>
            <div class="box2">
                <p>Don't have an account? </p>
                <a href="./signUp.jsp">Register</a>
            </div>
        </div>
    </div>
</body>

</html>