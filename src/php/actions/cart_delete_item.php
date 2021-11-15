<?php
include_once "db_connect.php";

$user_id = $_SESSION['user_id'];
$product_id = $_POST['product_id'];
$delete = " DELETE FROM cart
            WHERE user_id='$user_id' AND product_id='$product_id' AND purchase_id IS NULL";
mysqli_query($conn, $delete);


?>