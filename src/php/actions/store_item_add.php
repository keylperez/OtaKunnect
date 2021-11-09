<?php
session_start();
include "db_connect.php";

$name = trim($_POST['item_name']);
$price = trim($_POST['price']);
$desc = trim($_POST['desc']);
$anime = trim($_POST['anime']);
$category = trim($_POST['category']);
$store_id = $_SESSION['store_id'];

$target_dir = "../../uploads/store/";
$target_dir2 = "src/uploads/store/";
$target_main_dir = $target_dir2.basename($_FILES["image"]["name"]);
$target_file = $target_dir . basename($_FILES["image"]["name"]);
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));


$search_anime = "SELECT anime_id from anime WHERE name='$anime'";
$anime = mysqli_query($conn, $search_anime);
$anime = mysqli_fetch_assoc($anime);

$search_category = "SELECT category_id FROM category WHERE name='$category'";
$category = mysqli_query($conn, $search_category);
$category = mysqli_fetch_assoc($category);

$insert_to_product = "INSERT INTO product(name, img, price, description, anime_id, category_id, store_id) 
                    VALUES('$name','$target_main_dir','$price','$desc','$anime','$category','$store_id');";
mysqli_query($conn, $insert);
mysqli_close($conn);
//header("Location: ../../../home.php");
exit();
?>