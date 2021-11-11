<?php
session_start();
include_once "db_connect.php";



if ($_POST['password'] == $_POST['confirm-password']) {


	$uname = trim($_POST['username']);
	$pass = trim($_POST['password']);
	$name = trim($_POST['name']);
	$email = trim($_POST['email']);

	$check = "SELECT username, email FROM users Where username = '$uname', email = '$email'";
	$insert = "INSERT INTO users(username,password,name,email) VALUES('$uname','$pass','$name','$email')";

	$uname_check = mysqli_query($conn, $check);
	if (!$uname_check || mysqli_num_rows($uname_check) == 0) {
		mysqli_query($conn, $insert);
		mysqli_close($conn);
		// echo '<h6>Account created successfully</h6>';
		sleep(3);
		header("Location: ../../../index.php?success=Created account successfully");
		exit();
	} else {
		header("Location: ../../../index.php?error=Account already exists");
		// echo '<h6>Account already exists</h6>';
		exit();
	}
}
