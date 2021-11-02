<?php
session_start();
include "db_connect.php";



if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['name']) && isset($_POST['email'])) {

	
	$uname = trim($_POST['username']);
	$pass = trim($_POST['password']);
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);

    $check = "SELECT username, email FROM users Where username = '$uname', email = '$email'";
    $insert = "INSERT INTO users(username,password,name,email) VALUES('$uname','$pass','$name','$email')";

	$uname_check = mysqli_query($conn, $check);
	if (mysqli_num_rows($uname_check) == 0) {
		mysqli_query($conn, $insert);
		mysqli_close($conn);
		header("Location: ../../../index.php?created=Account created successfully");
		
	} else {
		header("Location: ../../../index.php?error=Email already exists");
	}
}
