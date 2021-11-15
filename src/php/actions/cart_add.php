<?php
include_once "db_connect.php";

$user_id = $_SESSION['user_id'];
$item_count = $_POST['item_count'];
$product_id = $_POST['product_id'];
$add = "    INSERT INTO cart(user_id, item_count, product_id)
            VALUES('$user_id','$item_count','$product_id')";
mysqli_query($conn, $add);


?>