<?php
session_start();
include_once "db_connect.php";


if (isset($_POST['username']) && isset($_POST['password'])) {

	$uname = trim($_POST['username']);
	$pass = trim($_POST['password']);
	$query = "  SELECT user_id, username, name, email, auth_level, store_id 
                FROM users
                WHERE username = '$uname' AND password = '$pass'";

	$result = mysqli_query($conn, $query);
	if (mysqli_num_rows($result) > 0) {

		$row = mysqli_fetch_assoc($result);
		$_SESSION['user_id'] = $row["user_id"];
		$_SESSION['username'] = $row["username"];
		$_SESSION['name'] = $row["name"];
		$_SESSION['email'] = $row["email"];
		$_SESSION['auth_level'] = $row["auth_level"];
		$_SESSION['store_id'] = $row["store_id"];
		sleep(3);
		header("Location: ../../../home.php");
		exit();
	} else {
		header("Location: ../../../index.php?error=Incorect Username or password");
		// echo '<h6>Incorect Username or password</span>';
		exit();
	}

	header("Location: ../../../index.php");
	// echo '<h6>Sign-in error</span>';
	exit();
}
