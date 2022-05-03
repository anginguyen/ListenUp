<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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

    <title>RESULTS | ListenUp</title>

    <style>
        .container {
            width: 80%;
            margin: 50px auto;
            font-size: 24px;
        }
        #search {
            text-align: center;
            width: 100%;
            margin: auto;
            margin-bottom: 30px;
        }
        #search label {
            padding-right: 10px;
        }
        #album-search {
            font-size: 24px;
            font-weight: 300;
            background-color: #404D66;
            border: 1px solid #1C2330;
            width: 90%;
            margin: auto;
            padding-left: 10px;
        }
        #title {
            font-size: 48px;
            border-bottom: 1px solid #1ED760;
            margin-top: 50px;
        }
        #total-results {
            margin-top: 15px;
            margin-bottom: 30px;
        }
        #album-result {
            background-color: #404D66;
            display: flex;
            padding: 20px;
            border-radius: 50px;
        }
        #album-cover {
            background-color: grey;
            width: 200px;
            height: 200px;
            margin-right: 25px;
            margin-left: 10px;
            border-radius: 20px;
        }
        #album-cover img {
            width: 200px;
            height: 200px;
            margin: 0;
            border-radius: 20px;
        }
        #album-details a {
            color:#C4C4C4;
            font-size: 42px;
        }
        #album-details a:hover {
            color:#2D7D19;
        }
        #rating {
            margin-top: 7%;
        }
        #rating i {
            font-size: 40px;
            padding-right: 2%;
        }
        .filled {
            color:#2D7D19;
        }
        .not-filled {
            color: #C4C4C4;
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
            <a class="nav-link" href="login.jsp">Login</a>
            <a class="nav-link" href="search.html">Albums</a>
            <a class="nav-link" id="spotify-nav" href="">Connect with Spotify</a>
        </div>
    </div>

    <div class="container">
        <form action="" method="GET" id="search">
            <label for="album-search">Album name:</label>
            <input type="text" name="album-search" id="album-search">
        </form>
        
        <div id="results">
            <p id="title">Results for "sour"</p>

            <p id="total-results">Showing 1 of 1 result(s)</p>

            <div id="album-result">
                <div id="album-cover"></div>

                <div id="album-details">
                    <a href="details.jsp?name=sour" id="album-title">SOUR</a>
                    <p>Olivia Rodrigo</p>
                    
                    <div id="rating">
                        <i class="fa-solid fa-star filled"></i>
                        <i class="fa-solid fa-star filled"></i>
                        <i class="fa-solid fa-star filled"></i>
                        <i class="fa-solid fa-star filled"></i>
                        <i class="fa-solid fa-star not-filled"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/9b2ed648bc.js" crossorigin="anonymous"></script>
</body>
</html>
