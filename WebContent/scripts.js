 
//Author: Rashika Koul
//SWE 642 : Homework 4
//javascript validation

function wrongPerson() {
    document.cookie = "name=null;" + " expires=Thu, 01-Jan-95 00:00:01 GMT";
    location.reload();
}

function greet() {
    var now = new Date();
    var hour = now.getHours();
    var name = undefined;
    var greeting_element = document.getElementById("greeting");
    var greeting_msg = '<b>Good ';
    if (hour < 12)
        greeting_msg += 'morning ';
    else if (hour < 18)
        greeting_msg += 'afternoon ';
    else
        greeting_msg += 'evening ';

    if (getCookie("name") !== null) {
        name = getCookie("name");
    }
    else {
        while (name === null || name === undefined || name === "") {
            name = window.prompt("Please enter your name:", "Rashika");
            var d = new Date();
            d.setDate(d.getDate + 1);
            document.cookie = "name=" + escape(name) + "; expires=" + d;
        }
    }

    greeting_msg += name + "! Welcome to Assignment 3.</b>";
    greeting_msg += " Click " + "<a href = 'javascript:wrongPerson()'>here</a> " +
        " if you are not " + name + ". ";
    greeting_element.innerHTML = greeting_msg;
}

function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts[1].split(";")[0];
    else return null;
}


function calc(data) {
    data = data.replace(/(^[,\s]+)|([,\s]+$)/g, '');
    data = data.split(',');
    if (data.length !== 10) {
    	$('#dialog').html("Enter 10 numbers.");
    	$('#dialog').dialog();
    	dataError = true;
        return false;
    }
    var sum = 0;
    for (var x of data) {
        if (x === "") {
        	$('#dialog').html("Enter 10 numbers.");
        	$('#dialog').dialog();
        	dataError = true;
            return false;
        }
        x = x - '0';
        if (x < 1 || x > 100) {
        	$('#dialog').html("Numbers must be in range [1-100].");
        	$('#dialog').dialog();
        	dataError = true;
            return false;
        }
    }
    dataError = false;
    return true;
}

function validateForm(event) {

    var alphabet = /^[A-Za-z]+$/;
    var alphabetNumeric = /^[A-Za-z0-9]+$/;
    var alphaNumericWithSpace = /^[A-Za-z0-9 ]+$/;
    var likesCount = 2;
    var interestCount = 1;
    var email = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

    var errorMessage = "";
    if (!document.getElementById("studentID").value.match(alphabetNumeric)) {
        errorMessage += "Student ID should contain only appropriate numeric, alphabet or alphanumeric characters. <br />";
        document.getElementById("studentID").value = "";
    }
    if (!document.getElementById("username").value.match(alphabet)) {
        errorMessage += "Username should contain only Alphabets. \n";
        document.getElementById("username").value = "";
    }
    if (!document.getElementById("address").value.match(alphaNumericWithSpace)) {
        errorMessage += "Street Address should contain only appropriate numeric, alphabet or alphanumeric characters. \n";
        document.getElementById("address").value = "";
    }
    if (!document.getElementById("email").value.match(email)) {
        errorMessage += "Email Id should be valid. \n";
        document.getElementById("email").value = "";
    }
    var likes = document.getElementsByName("likes");
    var count = 0;
    for (var i = 0; i < likes.length; i++) {
        if (likes[i].checked) {
            count++;
        }
    }
    if (count < likesCount) {
        errorMessage += "Check atleast 2 likes about GMU. \n";
    }
    
    var interest = document.getElementsByName("interest");
    count = 0;
    for (var i = 0; i < interest.length; i++) {
        if (interest[i].checked) {
            count++;
        }
    }
    if (count !== interestCount) {
        errorMessage += "Check an interest at GMU. \n";
    }

    if (errorMessage !== "") {
        //alert(errorMessage);
    	$('#dialog').html(errorMessage);
    	$('#dialog').dialog();
        event.preventDefault();
        return false;
    } 
//        else { 
//    	//alert("Feedback submitted!");
//        $('#dialog').html("Feedback submitted!");
//    	$('#dialog').dialog();
//        return true;
//    }
}

function resetForm() {
    document.getElementById('city').innerHTML = "";
    document.getElementById('state').innerHTML = "";
    document.getElementById("zipcode-error").innerHTML = "";
    document.getElementById("average").innerHTML = "";
    document.getElementById("maximum").innerHTML = "";
    document.getElementById("data-error").innerHTML = "";
}

function validateZip(zip) {
    try {
        var asyncRequest = new XMLHttpRequest();
        asyncRequest.onreadystatechange = function () {
            callBack(zip, asyncRequest);
        };
        asyncRequest.open("GET", "zipcodes.json", true);
        asyncRequest.withCredentials = true;
        asyncRequest.send();
    }
    catch (exception) {
        //alert("Request failed.");
        $('#dialog').html("Request failed.");
    	$('#dialog').dialog();
    }
}

function callBack(zip, asyncRequest) {
	zipError = true;
    document.getElementById('city').value = "";
    document.getElementById('state').value = "";
    if (asyncRequest.readyState == 4) {
        if (asyncRequest.status == 200 || asyncRequest.status == 304) {
            var data = JSON.parse(asyncRequest.responseText);
            result = isValid(zip, data)
            if (result.valid) {
            	zipError = false;
                document.getElementById('city').value = result.city;
                document.getElementById('state').value = result.state;
            } else {
            	zipError = true;
            	$('#dialog').html("Invalid Zip Code.");
            	$('#dialog').dialog();
            }
        }
    }
}

function isValid(zip, data) {
    var zipcodes = data.zipcodes;
    for (var element of zipcodes) {
        if(element.zip === zip) {
            return {
                valid: true,
                city: element.city,
                state: element.state
            };
        }
    }
    return {
        valid: false
    };
}