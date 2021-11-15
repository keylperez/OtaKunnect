<?php
include_once "db_connect.php";

$user_id = $_SESSION['user_id'];
$query = "  SELECT c.product_id, c.item_count, p.price 
            FROM cart c INNER JOIN product p ON p.product_id=c.product_id
            WHERE c.user_id='$user_id' AND c.purchase_id IS NULL";
$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        array_push($_SESSION["cart"],array($row["product_id"],$row["item_count"],$row["price"]));
    }
}
?>