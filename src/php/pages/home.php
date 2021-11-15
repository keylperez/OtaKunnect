<?php
session_start();
include "../actions/check_session.php";
include "../actions/query_random_items.php";
include "../actions/query_preference.php";
include "../actions/query_preference_items.php";

if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Home - Otakunnect</title>
    <link rel="stylesheet" href="../../css/style.css">
    <script src="../../js/script.js"></script>
</head>

<body class="body-home">
    <main class="section section-main">

        <?php include("../layout/header.php"); ?>
    </main>
    <section class="section section-home">
        <!-- <ul>
            <li>
                <h2>Stores</h2>
            </li>
            <li>
                <h2>Stickers</h2>
            </li>
            <li>
                <h2>Posters</h2>
            </li>
        </ul> -->

        <div class="item-section item-section-preference">
            <h2>Prefered Items:</h2>
            <div class="item-section-container item-section-container-preference">
                <?php
                $count = 0;
                $size = count($_SESSION['preference_items']);
                while ($count < $size) {
                    echo '<div class="item-section-container-item">';
                    echo '<div class="item-section-container-item-container-img"><img src="' . $_SESSION['preference_items'][$count][2] . '" alt="""></div>';
                    echo '<h5 class="name">' . $_SESSION['preference_items'][$count][1] . '</h5>';
                    echo '<h5 class="price">₱' . $_SESSION['preference_items'][$count][3] . '</h5>';
                    echo '</div>';
                    $count++;
                }
                ?>

            </div>
        </div>
        <div class="item-section item-section-display">
            <h2>Display:</h2>
            <div class="item-section-container item-section-container-display">
                <?php
                $count = 0;
                $size = count($_SESSION['random_items']);
                while ($count < $size) {
                    echo '<div class="item-section-container-item">';
                    echo '<div class="item-section-container-item-container-img"><img src="' . $_SESSION['random_items'][$count][2] . '" alt=""></div>';
                    echo '<h5 class="name">' . $_SESSION['random_items'][$count][1] . '</h5>';
                    echo '<h5 class="price">₱' . $_SESSION['random_items'][$count][3] . '</h5>';
                    echo '</div>';
                    $count++;
                }
                ?>
            </div>
        </div>
    </section>
</body>