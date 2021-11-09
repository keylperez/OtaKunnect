<?php
session_start();
include "db_connect.php";

$product_id = $_POST['product_id'];
$store_id = $_SESSION['store_id'];
$filename = $_SESSION['img'];
if (file_exists($filename)) {
    unlink($filename);
    echo 'File '.$filename.' has been deleted';
} else {
    echo 'Could not delete '.$filename.', file does not exist';
}

$delete = " UPDATE product
            SET deleted = 'Deleted'
            WHERE product_id='$product_id' AND store_id='$store_id'";
mysqli_query($conn, $insert);
mysqli_close($conn);
//header("Location: ../../../home.php");
exit();
?>