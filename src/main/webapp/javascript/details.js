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
	var username = document.querySelector("#username");
	if (username.value == "Sign" || username.value == "guest") {
		event.preventDefault();
		alert("Please log in or make an account to share your opinion!");
		return;
	}
	
    var review = document.querySelector("#review");
    var errorMsgDiv = document.querySelector("#error-msg");
    var error = false;
    
    // Clears any old error messages
    errorMsgDiv.innerHTML = "";

    // Empty rating error
    if (rating.value == "") {
        event.preventDefault();
        var errorMsg = document.createElement("p");
        errorMsg.innerHTML = "Please provide a rating.";
        errorMsgDiv.appendChild(errorMsg);
        error = true;
    }

    // Empty review error
    if (review.value == "") {
        event.preventDefault();
        var errorMsg = document.createElement("p");
        errorMsg.innerHTML = "Please write a review.";
        errorMsgDiv.appendChild(errorMsg);
        error = true;
    }
    
    if (!error) {
		window.onload = alert("Your review has been submitted!");
	}
}

// Toggles between review, all reviews, and chat windows
document.querySelector("#review-btns a").onclick = function() {
    document.querySelector("#rate-and-review").style.display = "none";
    document.querySelector("#all-reviews").style.display = "initial";
}

document.querySelector("#write-review-link a").onclick = function() {
    document.querySelector("#all-reviews").style.display = "none";
    document.querySelector("#rate-and-review").style.display = "initial";
}
document.querySelector("#back-link").onclick = function() {
	document.querySelector("#all-reviews").style.display = "initial";
	document.querySelector("#chat").style.display = "none";
}
document.querySelector("#chat-btn").onclick = function() {
	document.querySelector("#rate-and-review").style.display = "none";
	document.querySelector("#all-reviews").style.display = "none";
	document.querySelector("#chat").style.display = "initial";
}

// Displays new message in the chatbox when user sends 
document.querySelector("#msg-form").onsubmit = function(event) {
	event.preventDefault();
	
	var msg = document.querySelector("#msg-input").value;
	var msgBox = document.querySelector("#messages");
	if (msg != "") {
		var newMsg = document.createElement("div");
		newMsg.classList.add("user-msg");
		newMsg.innerHTML += msg;
		msgBox.appendChild(newMsg);
	}
	document.querySelector("#msg-input").value = "";
	msgBox.scrollTop = msgBox.scrollHeight ;
}