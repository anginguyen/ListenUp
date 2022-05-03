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

    <title>SEARCH | ListenUp</title>

    <style>
        .container {
            width: 80%;
            text-align: center;
            margin: 50px auto;
        }
        .container p {
            font-size: 36px;
        }
        #search {
            margin-bottom: 100px;
        }
        #album-search {
            font-size: 24px;
            font-weight: 300;
            background-color: #404D66;
            border: 1px solid #1C2330;
            width: 75%;
            padding: 0 10px;
        }
        #album-imgs-div {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }
        .album-img img {
            width: 23%;
            height: auto;
            margin: 0 1%;
        }
    </style>
</head>
<body>
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
							disp2 = "home.jsp"; //should be changed to profile page for user
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
            <a id="listenup-name" href="home.jsp">ListenUp</a>
        </div>

        <div id="nav-right"> 
            <a class="nav-link" href="<%=disp2%>"><%=em%></a>
            <a class="nav-link" href="<%=disp%>"><%=red%></a>
            <a class="nav-link" href="search.jsp">Albums</a>
            <a class="nav-link" id="spotify-nav" href="">Connect with Spotify</a>
        </div>
    </div>

    <div class="container">
        <div id="search">
            <p>Find an album:</p>
            
            <form action="results.jsp" method="GET">
                <input type="text" name="album-search" id="album-search">
            </form>
        </div>

        <div id="popular-albums">
            <p>Popular Albums This Week:</p>

            <div id="album-imgs-div">
                <div class="album-img"></div>
                <div class="album-img"></div>
                <div class="album-img"></div>
                <div class="album-img"></div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script>
        // Retrieves access token for Spotify API 
        let httpRequest = new XMLHttpRequest(); 
        let authEndpoint = 'https://accounts.spotify.com/api/token';
        httpRequest.open('POST', authEndpoint);

        httpRequest.setRequestHeader('Authorization', 'Basic ' + btoa('bc70b7456e4046c99f46c807d5969037:4d4e2da2e3b5483192e6d10dc78fa6da'));
        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        httpRequest.send('grant_type=client_credentials');

        httpRequest.onreadystatechange = function() {
            if(httpRequest.readyState == 4) {
                if(httpRequest.status == 200) {
                    accessAPI(httpRequest.responseText);
                }
                else {
                    console.log(httpRequest.status);
                }
            }
        }

        // Calls API to get new album releases
        function accessAPI(results) {
            let resultsJSON = JSON.parse(results);

            let endpoint = "https://api.spotify.com/v1/browse/new-releases?country=US&limit=4";
            httpRequest.open("GET", endpoint);
            httpRequest.setRequestHeader('Authorization', 'Bearer ' + resultsJSON.access_token);
            httpRequest.send();

            httpRequest.onreadystatechange = function() {
                if(httpRequest.readyState == 4) {
                    if(httpRequest.status == 200) {
                        displayNewReleases(httpRequest.responseText);
                    }
                    else {
                        console.log(httpRequest.status);
                    }
                }
            }
        }

        // Displays new album releases on page 
        function displayNewReleases(results) {
            let resultsJSON = JSON.parse(results);

            let albums = document.querySelectorAll(".album-img");
            
            //should be 4 but changed to demo
            for (let i=0; i < 3; ++i) {
                let albumName = resultsJSON.albums.items[i].name;
                let albumImg = resultsJSON.albums.items[i].images[0].url;
                
                let newATag = document.createElement("a");
                newATag.setAttribute("href", "details.jsp?name=" + albumName);

                let newImg = document.createElement("img");
                newImg.setAttribute("src", albumImg);
                newImg.setAttribute("alt", albumName);

                newATag.appendChild(newImg);
                albums[0].appendChild(newATag);
            }
            /* added this just for demo to be able to click on sour */
            let albumName = "Sour";
            let albumImg = "https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a";
            
            let newATag = document.createElement("a");
            newATag.setAttribute("href", "details.jsp?albumid=" + "6s84u2TUpR3wdUv4NgKA2j");

            let newImg = document.createElement("img");
            newImg.setAttribute("src", albumImg);
            newImg.setAttribute("alt", albumName);

            newATag.appendChild(newImg);
            albums[0].appendChild(newATag);
        }
    </script>
</body>
</html>
