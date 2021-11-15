<?php
include_once "db_connect.php";

$date = date('Y-m-d H:i:s');
$claim_date = mktime(59, 59, 23, date("m")+1, date("d"), date("Y"));
$total_price = 0.00;
for($count = 0;$count < count($_SESSION['cart']); $count++){
    $total_price += $_SESSION['cart'][$count][2];
}
$user_id = $_SESSION['user_id'];

$insert = " INSERT INTO purchase(date, claim_date, total_price, user_id)
            VALUES('$date','$claim_date','$total_price','$user_id')";
mysqli_query($conn, $insert);

$query = "  SELECT purchase_id
            FROM purchase
            WHERE user_id='$user_id' AND date='$date' AND claim_date='$claim_date' AND total_price='$total_price'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$purchase_id = $row['purchase_id'];


$insert = " UPDATE cart
            SET purchase_id='$purchase_id'
            WHERE user_id='$user_id' AND purchase_id IS NULL";
mysqli_query($conn, $insert);

?>