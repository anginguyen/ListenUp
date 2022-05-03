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

    <title>DETAILS | ListenUp</title>

    <style>
        .container {
            width: 95%;
            max-width: 1500px;
            margin: 15px auto;
            font-size: 24px;
        }
        #title {
            font-size: 48px;
            height: 55px;
        }
        #artist {
            font-size: 32px;
        }
        #album {
            display: flex;
            justify-content: space-between;
        }
        #album-cover {
            background-color: grey;
            width: 250px;
            height: 250px;
        }
        #album-cover img {
            width: 250px;
            height: 250px;
        }
        .section-header {
            font-size: 32px;
            padding: 10px 0;
        }
        #middle {
            width: 55%;
        }
        #album-table {
            text-align: left;
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 10%;
        }
        #album-table th {
            font-size: 28px;
            border-bottom: 2px solid white;
            padding-bottom: 5px;
            padding-left: 10px;
        }
        #album-table td {
            padding-top: 5px;
            padding-left: 10px;
        }
        #stars {
            display: flex;
            margin-bottom: 40px;
        }
        #stars i, #overall-stars i {
            color: #C4C4C4;
            font-size: 60px;
            padding-right: 10px;
        }
        #stars i:hover, #stars i:not(:hover) {
            transition: 0.3s;
        }
        #review {
            color: white;
            background-color: #404D66;
            font-size: 24px;
            border: none;
            width: 100%;
            height: 200px;
            padding: 10px;
        }
        #error-msg {
            margin-bottom: 10px;
        }
        #error-msg p {
            font-size: 20px;
            line-height: 20px;
            color: red;
        }
        #review-btns {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #review-btns button {
            color: white;
            font-size: 24px;
            background-color: #1C2330;
            border: none;
            border-radius: 10px;
            padding: 0 25px;
        }
        #review-btns button:hover {
            color: #1C2330;
            background-color: white;
        }
        #review-btns a:hover, #write-review-link a:hover {
            color: #2D7D19;
        }
        #all-reviews {
            display: none;
        }
        #overall-stars {
            display: flex;
        }
        #write-review-link {
            display: flex;
            justify-content: flex-end;
        }
        .review-box {
            background-color: #404D66;
            padding: 20px;
            margin-bottom: 15px;
        }
        .filled {
            color: #1ED760;
            font-size: 15px;
        }
        .unfilled {
        	color: #C4C4C4;
            font-size: 15px;
        }
        .username {
            color: #C4C4C4;
        }
        #right {
            text-align: center;
            margin-top: 15%;
        }
        #right button {
            font-size: 32px;
            color: white;
            background-color: #404D66;
            border: none;
            width: 100%;
            margin-top: 3%;
            padding: 5px;
        }
        #right button:hover {
            color: #404D66;
            background-color: #C4C4C4;
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
        <div id="album-name">
        	<%String ID = (String)request.getParameter("albumid"); %>
        	<%String name = Helper.getName(ID); %>
       		<%String artist = Helper.getArtist(ID); %>
            <p id="title"> <%=name%> </p> <!-- sql -->
            <p id="artist"><%=artist%></p>
        </div>

        <div id="album">
            <div id="left">
                <div id="album-cover">
               		 <!-- more generic -->
               		 <% String cover = Helper.getCover(ID); %>
               		 <% ArrayList<ArrayList<String>> rev = Helper.getRevs(ID); %>
                	<img src="<%=cover%>" alt="album cover">
                </div>

                <div id="album-tracklist">
                	<!-- sql -->
                    <p class="section-header">Tracklist</p>
					<% ArrayList<String> songs = Helper.getSongs(ID); %>
					<% for (int i =0; i<songs.size(); i++){
						out.println("<p>"+(i+1)+". "+songs.get(i));
					}
					%>
                    <!-- <p>1. brutal</p>
                    <p>2. traitor</p>
                    <p>3. drivers license</p> -->
                    <!-- <p>4. 1 step forward, 3 steps back</p>
                    <p>5. deja vu</p>
                    <p>6. good 4 u</p>
                    <p>7. enough for you</p>
                    <p>8. happier</p>
                    <p>9. jealousy, jealousy</p>
                    <p>10. favorite crime</p>
                    <p>11. hope ur ok</p> -->
                </div>
            </div>

            <div id="middle">
                <table id="album-table">
                    <tr>
                        <th>Album Details</th>
                        <th>Featured Artists</th>
                        <th>Production Credits</th>
                    </tr>
                    <tr>
                    	<% String date = Helper.getDate(ID); %>
                        <td>Release Date: <%=date%></td>
                        <td></td>
                        <td>Jack Antonoff</td>
                    </tr>
                    <tr>
                    	<% Helper.update(ID); %>
                   		<% double rating = Helper.getRating(ID); %>
                        <td>Rating: <%=rating%></td>
                        <td></td>
                        <td>Paul Cartwright</td>
                    </tr>
                    <tr>
                    	<% String duration = Helper.getAlbumDuration(ID); %>
                        <td>Duration: <%=duration%> </td>
                        <td></td>
                        <td>Annie Clark</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Andi Elloway</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Josh Farro</td>
                    </tr>
                </table>

                <div id="rate-and-review">
                    <p class="section-header">Rate and Review</p>

                    <div id="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>

                    <form action="ReviewDispatcher" method="GET" id="review-form">
                        <textarea id="review" name="review"></textarea>
						
						<input type="hidden" name="username" id="username" value=<%=em%>>
                        <input type="hidden" name="rating" id="rating">
						<input type="hidden" name="id" id="albumid" value=<%=Helper.getID(name)%>>
                        <div id="error-msg"></div>

                        <div id="review-btns">
                            <button type="submit">Submit</button>
                            <a>View all reviews</a>
                        </div>
                    </form>
                </div>

                <div id="all-reviews">
                    <p class="section-header">All Reviews</p>
        
                    <div id="overall-stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
            
                    <div id="write-review-link">
                        <a>Write a review</a>
                    </div>
                    
                    <% 
                    	// Iterate through list of all reviews for this album
                    	ArrayList<ArrayList<String>> allReviews = Helper.getRevs(ID);
                    	for (ArrayList<String> review : allReviews) {
                    %>
                    		<div class="review-box">
                    			<div class="user-stars">
                    			 	<% 
                    			 		// Rating 
                    			 		int revRating = Integer.valueOf(review.get(2));
                    			 		for (int i=0; i < revRating; ++i) {
                    			 			out.println("<i class=\"fa-solid fa-star filled\"></i>");
                    			 		}
                    			 		for (int i=revRating; i < 5; ++i) {
                    			 			out.println("<i class=\"fa-solid fa-star unfilled\"></i>");
                    			 		}
                    			 	%>
                    			</div>
                    			
                    			<%
                    				// Username & review
	                    			out.println("<p class=\"username\">" + review.get(1) + "</p>");
	                    			out.println("<p class=\"user-review\">" + review.get(0) + "</p>");
                    			%>
                    		</div>
                    <% } %>
                </div>
            </div>

            <div id="right">
                <p>Chat with someone about this album:</p>
                <button type="button">Chat</button>
            </div>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/9b2ed648bc.js" crossorigin="anonymous"></script>

    <script>
        var stars = Array.from(document.querySelectorAll("#stars i"));
        var clicked = false;
        var starClicked = null;
        var rating = document.querySelector("#rating");
        
        for (let i=0; i < stars.length; ++i) {
            // Sticks color to stars for user's rating
            stars[i].onclick = function() {
                changeStarColor(0, i);
                clicked = true;
                starClicked = i;
                rating.value = starClicked+1;
            }

            // Changes all stars to the one that user is hovering over
            stars[i].onmouseover = function() {
                if (!clicked) {
                    changeStarColor(0, i);
                }
                else {
                    changeStarColor(starClicked+1, i);
                }
            }

            // Resets the star colors
            stars[i].onmouseleave = function() {
                // Resets all star colors since user hasn't rated
                if (!clicked) {
                    for (let j=0; j < stars.length; ++j) {
                        stars[j].style.color = "#C4C4C4";
                    }
                }
                // Resets only the stars that come after user's rating
                else {
                    for (let j=starClicked+1; j < stars.length; ++j) {
                        stars[j].style.color = "#C4C4C4";
                    }
                }
            }
        }

        // Sets color of all stars before and on the one that the user is on
        function changeStarColor(start, placement) {
            for (let i=start; i < stars.length; ++i) {
                if (i <= placement) {
                    stars[i].style.color = "#2D7D19";
                }
                else {
                    stars[i].style.color = "#C4C4C4";
                }
            }
        }

        // Review form validation 
        document.querySelector("#review-form").onsubmit = function(event) {
            var review = document.querySelector("#review");
            var errorMsgDiv = document.querySelector("#error-msg");
            
            // Clears any old error messages
            errorMsgDiv.innerHTML = "";

            // Empty rating error
            if (rating.value == "") {
                event.preventDefault();
                var errorMsg = document.createElement("p");
                errorMsg.innerHTML = "Please provide a rating.";
                errorMsgDiv.appendChild(errorMsg);
            }

            // Empty review error
            if (review.value == "") {
                event.preventDefault();
                var errorMsg = document.createElement("p");
                errorMsg.innerHTML = "Please write a review.";
                errorMsgDiv.appendChild(errorMsg);
            }
        }

        document.querySelector("#review-btns a").onclick = function() {
            document.querySelector("#rate-and-review").style.display = "none";
            document.querySelector("#all-reviews").style.display = "initial";
        }

        document.querySelector("#write-review-link a").onclick = function() {
            document.querySelector("#all-reviews").style.display = "none";
            document.querySelector("#rate-and-review").style.display = "initial";
        }
    </script>
</body>
</html>
