<?php
session_start();
include_once "src/php/actions/log_function.php";
include_once "src/php/actions/db_connect.php";
include_once "src/php/actions/query_preference.php";
include_once "src/php/actions/query_preference_items.php";

if (isset($_SESSION['username'])) {
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
    <title>Sign-up Otakunnect</title>
    <link rel="stylesheet" href="src/css/style.css">
    <script defer src="src/js/script.js"></script>
</head>

<body class="body-login">
    <header class="page-header page-header-sizing">
        <h1>OtaKunnect</h1>
    </header>
    <main class="main-login">
        <?php include("src/php/layout/login_form.php"); ?>
        <div class="main-login-about">
            <svg xmlns="//www.w3.org/2000/svg" version="1.1" class="svg-filters" style="display:none;">
                <defs>
                    <filter id="marker-shape">
                        <feTurbulence type="fractalNoise" baseFrequency="0 0.15" numOctaves="1" result="warp" />
                        <feDisplacementMap xChannelSelector="R" yChannelSelector="G" scale="30" in="SourceGraphic" in2="warp" />
                    </filter>
                </defs>
            </svg>
            <h4><span class="realistic-marker-highlight">What are we?</span></h4>
            <p><mark>We are anime fans who do our best to bring each other a lot closer. Using our website, you can set up sale for all of your weeaboo goods with ease for any upcoming conventions. At the same time, you can purchase items in advance before the conventions begins; so, you can just simply pick up the goods once you reach the shop in the convention.</mark></p>
        </div>
        <img src="src/img/login/Group-of-Characters.png" alt="">

    </main>

</body>

</html>