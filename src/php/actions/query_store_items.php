<?php
include_once "db_connect.php";

$store_id= $_SESSION['store_id'];
$query = "  SELECT product_id, name, img, price, description 
            FROM product
            Where store_id='$store_id'";

$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        array_push($_SESSION["store_items"],array($row["product_id"],$row["name"],$row["img"],$row["price"],$row["description"],$row["store_id"]));
    }
}
?>