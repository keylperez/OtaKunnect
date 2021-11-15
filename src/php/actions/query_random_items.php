<?php
include_once "db_connect.php";

$query = "  SELECT product_id, name, img, price, description, store_id
            FROM product 
            ORDER BY RAND() 
            LIMIT 20;";
$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        array_push($_SESSION["random_items"],array($row["product_id"],$row["name"],$row["img"],$row["price"],$row["description"],$row["store_id"]));
    }
}
?>