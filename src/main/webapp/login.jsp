<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
   <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com"> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="style.css">

    <title>LOGIN | ListenUp</title>

    <style>
        .container {
            width: 35%;
            margin: 50px auto;
        }
        #login-box {
            border: 2px solid white;
            padding: 5% 15%;
        }
        #login-box h1 {
            font-size: 48px;
            text-align: center;
            font-weight: 700;
        }
        #login-box label {
            font-size: 30px;
            line-height: 10px;
        }
        #login-box input {
            font-size: 24px;
            font-weight: 300;
            background-color: #404D66;
            width: 100%;
            margin-bottom: 10%;
        }
        #login-box button {
            color: #2A3343;
            font-size: 28px;
            background-color: white;
            border: none;
            border-radius: 10px;
            width: 100%;
        }
        #login-box button:hover {
            color: white;
            background-color: #2D7D19;
        }
        #login-box a {
            font-size: 24px;
        }
        #forgot-password-link:hover, #spotify-login {
            color: #2D7D19;
        }
        #spotify-login:hover {
            color: #49c929;
        }
        #register-redirect {
            text-align: center;
            margin-top: 10%;
            width: 100%;
        }
        #register-redirect p {
            font-size: 32px;
            border-bottom: 1px solid white;
        }
        #redirect-btn {
            font-size: 32px;
            color: #2A3343;
            background-color: white;
            border: none;
            width: 100%;
            margin-top: 3%;
        }
        #redirect-btn:hover {
            color: white;
            background-color: #2D7D19;
        }
    </style>
</head>
<body>
    <div id="navbar">
        <div id="nav-left">
            <a id="listenup-name" href="home.jsp">ListenUp</a>
        </div>

        <div id="nav-right"> 
            <a class="nav-link" href="signup.jsp">Sign Up</a>
            <a class="nav-link" href="login.html">Login</a>
            <a class="nav-link" href="search.html">Albums</a>
            <a class="nav-link" id="spotify-nav" href="">Connect with Spotify</a>
        </div>
    </div>

    <div class="container">
    <% String er = (String) request.getAttribute("error");
			if (er != null) out.println(er);
			%>
        <div id="login-box">
            <h1>Login</h1>

            <form action="LoginDispatcher" method="GET">
                <label for="email-login">Email</label><br>
                <input type="text" name="email-login" id="email-login">

                <br>

                <label for="password-login">Password</label><br>
                <input type="password" name="password-login" id="password-login">
                
                <button type="submit">Log In</button>
            </form>
            
           <!--  <a href="" id="forgot-password-link">Forgot your password?</a><br> -->

            <a href="" id="spotify-login">Login with Spotify</a>
        </div>

        <div id="register-redirect">
            <p>New to ListenUp?</p>
            <button id="redirect-btn">Create your ListenUp account now!</a>
        </div>

        <script>
            document.querySelector("#redirect-btn").onclick = function() {
                location.href = "signup.jsp";
            };
        </script>
    </div>
</body>
</html>
