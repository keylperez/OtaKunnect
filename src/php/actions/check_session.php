<?php

if(!isset($_SESSION["cart"])){
    $_SESSION["cart"] = array();
}else{
    unset($_SESSION["cart"]);
    $_SESSION["cart"] = array();
}

if(!isset($_SESSION["random_items"])){
    $_SESSION["random_items"] = array();
}else{
    unset($_SESSION["random_items"]);
    $_SESSION["random_items"] = array();
}

if(!isset($_SESSION["store_items"]) && isset($_SESSION["store_id"])){
    $_SESSION["store_items"] = array();
}else{
    unset($_SESSION["store_items"]);
    $_SESSION["store_items"] = array();
}

if(!isset($_SESSION["preference_items"])){
    $_SESSION["preference_items"] = array();
}else{
    unset($_SESSION["preference_items"]);
    $_SESSION["preference_items"] = array();
}

if(!isset($_SESSION["preference"])){
    $_SESSION["preference"] = array();
}else{
    unset($_SESSION["preference"]);
    $_SESSION["preference"] = array();
}

?>