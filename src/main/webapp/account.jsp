<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com"> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="style.css">

    <title>MY ACCOUNT | ListenUp</title>

    <style>
        .container {
            width: 90%;
            max-width: 1500px;
            margin: 30px auto;
            font-size: 24px;
        }
        #header {
            display: flex;
            padding-bottom: 50px;
            border-bottom: 2px solid #C4C4C4;
            margin-bottom: 30px;
        }
        #profile-pic {
            background-color: grey;
            width: 230px;
            height: 200px;
            margin-right: 30px;
        }
        #profile-pic img {
            width: 200px;
            height: auto;
            margin-right: 30px;
        }
        #user-info {
            width: 100%;
        }
        #username {
            font-size: 40px;
            margin-top: 40px;
        }
        #follows {
            display: flex;
            justify-content: space-between;
            width: 30%;
        }
        #title {
            font-size: 32px;
        }
        #reviews {
            width: 50%;
        }
        .review-box {
            background-color: #404D66;
            padding: 20px;
            margin-bottom: 15px;
        }
        .review-box a {
            color: #C4C4C4;
        }
        .review-box a:hover {
            color: #909090;
        }
    </style>
</head>
<body>
		<%@page import="java.util.*"
	    import ="Util.Helper"
	    %>
	    
	
		<% 
	
			Cookie[] cookies  = request.getCookies();
			String em = "Sign Up";
			String red = "Login";
			String disp = "login.jsp";
			String disp2 = "signup.jsp";
			if(cookies!=null){	
				String temp ="";
				try{
					for(Cookie c : cookies){
						if(c.getName().equals("em")){ 
							em=c.getValue();
							temp = em.replaceAll("=", " ");
							em="" + temp +"";
							red = "Logout";
							disp = "LogoutDispatcher";
							disp2 = "account.jsp"; //should be changed to profile page for user
							break;
						}
					}
				}
				catch (Exception E){
				}
			}
	%>
    <div id="navbar">
        <div id="nav-left">
            <a id="listenup-name" href="search.jsp">ListenUp</a>
        </div>

        <div id="nav-right"> 
            <a class="nav-link" href=<%=disp2%>><%=em%></a>
            <a class="nav-link" href=<%=disp%>><%=red%></a>
            <a class="nav-link" href="search.jsp">Albums</a>
        </div>
    </div>

    <div class="container">
        <div id="header">
            <div id="profile-pic"></div>

            <div id="user-info">
                <p id="username">Username</p>

                <div id="follows">
                    <p>x followers</p>
                    <p>x following</p>
                    <p>x albums</p>
                </div>
            </div>
        </div>

        <div id="reviews">
            <p id="title">My Reviews</p>

            <div class="review-box">
                <p>for <a href="details.jsp">SOUR</a>:</p>
                <p id="review">I love this album</p>
            </div>

            <div class="review-box">
                <p>for <a href="details.jsp">Donda</a>:</p>
                <p id="review">mid</p>
            </div>
        </div>
    </div>
</body>
</html>