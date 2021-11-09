<?php
include_once "db_connect.php";


$user_id = $_SESSION['user_id'];
// $query = "  SELECT p.product_id, p.name, p.img, p.price, p.description, p.store_id
//             FROM product p, anime a, category c, preference pr
//             WHERE (pr.anime_id = a.anime_id OR pr.category_id = c.category_id) AND pr.user_id = '$user_id'
//             GROUP BY p.product_id
//             ORDER BY p.product_id
            
//             SELECT p.product_id, p.name, p.img, p.price, p.description, p.store_id
//             FROM product p, anime a
//             INNER JOIN preference pr ON pr.anime_id=a.anime_id
//             INNER JOIN category c ON pr.category_id=c.category_id
//             WHERE pr.user_id = '2' AND (p.anime_id = pr.anime_id OR p.category_id = pr.category_id)
//             GROUP BY p.product_id
//             ORDER BY p.product_id
            
            ";
$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        array_push($_SESSION["preference_items"],array($row["product_id"],$row["name"],$row["img"],$row["price"],$row["description"],$row["store_id"]));
    }
}
mysqli_close($conn);
?>