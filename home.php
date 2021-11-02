<?php
session_start();
if(!isset($_SESSION['username'])){
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
    <link rel="stylesheet" href="src/css/style.css">
    <script src="src/js/script.js"></script>
</head>

<body class="body-home">
    <nav class="page-header page-header-sizing">
        <h1>OtaKunnect</h1>
        <nav class="nav nav-main">
            <button id="home" class="nav-btn nav-btn-1">Home</button>
            <button id="store" class="nav-btn nav-btn-2">Stores</button>
            <button id="anime" class="nav-btn nav-btn-3">Anime</button>
            <button id="category" class="nav-btn nav-btn-4">Category</button>
            <button id="contact" class="nav-btn nav-btn-5">Contact</button>
        </nav>
        <div class="actions">
            <a href="#">
                <svg class="icon icon-inbox">
                    <use xlink:href="src/font/sprites/solid.svg#inbox"></use>
                </svg>
            </a>
            <a href="#">
                <svg class="icon icon-heart">
                    <use xlink:href="src/font/sprites/solid.svg#heart"></use>
                </svg>
            </a>
            <a href="#">
                <svg class="icon icon-search">
                    <use xlink:href="src/font/sprites/solid.svg#search"></use>
                </svg>
            </a>
            <a href="src/php/pages/user.php">
                <svg class="icon icon-settings">
                    <use xlink:href="src/font/sprites/solid.svg#user"></use>
                </svg>
            </a>
            <a href="src/php/actions/sign_out.php">
                <svg class="icon icon-logout">
                    <use xlink:href="src/font/sprites/solid.svg#sign-in-alt"></use>
                </svg>
            </a>
        </div>
    </nav>
    <header class="header-home">
        <div class="widget announcements">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum omnis architecto, accusantium suscipit eius praesentium fugit cum, quis deleniti voluptas quod dolore saepe. Culpa ad, eum rem officiis ipsa harum asperiores? Dolore fuga perferendis similique molestiae magni sequi deserunt eum. Fugiat voluptatum consectetur quibusdam sapiente culpa quae, cumque quos beatae?</p>

        </div>
        <div class="widget popular-items">

        </div>
        <div class="widget popular-stores">

        </div>

    </header>
</body> 