<?php
include_once "db_connect.php";


$user_id = $_SESSION['user_id'];
$count = 0;
$size = count($_SESSION['preference']);
for(;$count < $size;$count++){
    if(isset($_SESSION['preference'][$count][1])){
        $anime = $_SESSION['preference'][$count][0];
        $query = "  SELECT product_id, name, img, price, description, store_id
                FROM product
                WHERE anime_id='$anime'
                GROUP BY product_id
                ORDER BY RAND() 
                LIMIT 20";
        $result = mysqli_query($conn, $query); 
        if(mysqli_num_rows($result)>0){
            while($row = mysqli_fetch_assoc($result)){
                $size2 = count($_SESSION['preference']);
                $count2 = 0;
                $scan = 0;
                $bool = 0;
                while($count2 < $size2 && $scan==1){         //to check for duplicate
                    if($_SESSION['preference_items'][$count2][0]==$row['product_id']){
                           $bool = 1;
                    }
                    $count2++;
                }
                if($bool==0){
                    array_push($_SESSION["preference_items"],array($row["product_id"],$row["name"],$row["img"],$row["price"],$row["description"],$row["store_id"]));
                    $scan=1;
                }
            }
        }
    } else if(isset($_SESSION['preference'][$count][3])){
        $category = $_SESSION['preference'][$count][2];
        $query = "  SELECT product_id, name, img, price, description, store_id
                FROM product
                WHERE category_id='$category'
                GROUP BY product_id
                ORDER BY RAND() 
                LIMIT 20";
        $result = mysqli_query($conn, $query); 
        if(mysqli_num_rows($result)>0){
            while($row = mysqli_fetch_assoc($result)){
                $size2 = count($_SESSION['preference']);
                $count2 = 0;
                $bool = 0;
                while($count2 < $size2){         //to check for duplicate
                    if($_SESSION['preference_items'][$count2][0]==$row['product_id']){
                           $bool=1;
                    }
                    $count2++;
                }
                if($bool==0){
                    array_push($_SESSION["preference_items"],array($row["product_id"],$row["name"],$row["img"],$row["price"],$row["description"],$row["store_id"]));
                }
            }
        }
    }

    
}
?>