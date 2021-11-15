<?php
include_once "db_connect.php";

$user_id = $_SESSION['user_id']; 
$query = "  SELECT p.anime_id, a.name AS anime_name, p.category_id, c.name AS category_name
            FROM anime a
            RIGHT JOIN preference p ON p.anime_id=a.anime_id
            LEFT JOIN category c ON p.category_id=c.category_id
            Where p.user_id='$user_id'
            GROUP BY p.preference_id";
$result = mysqli_query($conn, $query);


if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        array_push($_SESSION["preference"],array($row["anime_id"],$row["anime_name"],$row["category_id"],$row["category_name"]));
    }
}
?>