function loginForm() {
    const email = document.querySelector("#email").value;
    const pass = document.querySelector("#password").value;
    const emailRegEx = /^[A-Za-z0-9]+\@([A-Za-z0-9]+\.)+[a-zA-Z]{2,3}$/;

    if (email == '' || email == null) {
        document.querySelector("#emailError").innerHTML = "Please enter your email.";
        return false;
    }
    if (!emailRegEx.test(String(email).toLowerCase())) {
        document.querySelector("#emailError").innerHTML = "Please provide a valid email address";
        return false;
    }
    if (pass == '' || pass == null) {
        document.querySelector("#passError").innerHTML = "Please enter your password";
        return false;
    }
    if (pass.length < 8) {
        document.querySelector("#passError").innerHTML = "Password length should be 8 characters.";
        return false;
    }
    if (pass != '' || pass != null || email != '' || email != null) {
        document.querySelector("#passError").innerHTML = "";
        document.querySelector("#emailError").innerHTML = "";
    }
}

function signUpForm() {
    const fname = document.querySelector("#fname").value;
    const lname = document.querySelector("#lname").value;
    const nameRegEx = /^[a-zA-Z]+$/;
    const email = document.querySelector("#email").value;
    const pass = document.querySelector("#password").value;
    const emailRegEx = /^[A-Za-z0-9]+\@([A-Za-z0-9]+\.)+[a-zA-Z]{2,3}$/;
    const pincode = document.querySelector("#pincode").value;
    const address = document.querySelector("#address").value;
    const confirm = document.querySelector("#confirmpassword").value;
    const contact = document.querySelector("#contact").value;

    if (!nameRegEx.test(fname)) {
        document.querySelector("#fnameError").innerHTML = "Enter Alphabet only";
        return false;
    }
    if (!nameRegEx.test(lname)) {
        document.querySelector("#lnameError").innerHTML = "Enter Alphabet only";
        return false;
    }
    if (email == '' || email == null) {
        document.querySelector("#emailError").innerHTML = "Please enter your email.";
        return false;
    }
    if (!emailRegEx.test(String(email).toLowerCase())) {
        document.querySelector("#emailError").innerHTML = "Please provide a valid email address";
        return false;
    }
    if (pincode == '' || pincode == null) {
        document.querySelector("#pincodeError").innerHTML = "Please enter your pincode";
        return false;
    }
    if (pincode.length < 6) {
        document.querySelector("#pincodeError").innerHTML = "Pincode length should be of 6 ";
        return false;
    }
    if (isNaN(pincode)) {
        document.querySelector("#pincodeError").innerHTML = "Enter Numbers Only";
        return false;
    }
    if (contact == "" || contact == null) {
        document.querySelector("#contactError").innerHTML = "Please enter your contact number";
        return false;
    }
    if (contact.length < 10) {
        document.querySelector("#contactError").innerHTML = "Contact length should be 10 digit";
        return false;
    }
    if (isNaN(contact)) {
        document.querySelector("#contactError").innerHTML = "Enter Numbers Only";
        return false;
    }
    if (address == "" || address == null) {
        document.querySelector("#addressError").innerHTML = "Please enter your address";
        return false;
    }
    if (pass == '' || pass == null) {
        document.querySelector("#passError").innerHTML = "Please enter your password";
        return false;
    }
    if (pass.length < 8) {
        document.querySelector("#passError").innerHTML = "Password length should be 8 characters.";
        return false;
    }
    if (confirm == '' || confirm == null) {
        document.querySelector("#confirmpasswordError").innerHTML = "Please enter your password";
        return false;
    }
    if (confirm.length < 8) {
        document.querySelector("#confirmpasswordError").innerHTML = "Password length should be 8 characters.";
        return false;
    }
    if (confirm != pass) {
        document.querySelector("#confirmpasswordError").innerHTML = "Password does not match";
        return false;
    }
    if (pass != '' || pass != null || email != '' || email != null || nameRegEx.test(fname) || nameRegEx.test(lname) || pincode != "" || pincode != null || address != "" || address != null || confirm != "" || confirm != null || contact != "" || contact != null) {
        document.querySelector("#passError").innerHTML = "";
        document.querySelector("#fnameError").innerHTML = "";
        document.querySelector("#lnameError").innerHTML = "";
        document.querySelector("#addressError").innerHTML = "";
        document.querySelector("#pincodeError").innerHTML = "";
        document.querySelector("#confirmpasswordError").innerHTML = "";
        document.querySelector("#contactError").innerHTML = "";
    }
}