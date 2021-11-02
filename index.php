<?php
session_start();
if(isset($_SESSION['username'])){
    header("Location: main.php");
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
    <nav class="page-header page-header-sizing">
        <h1>OtaKunnect</h1>
    </nav>
    <header class="header-login">
        <?php include("src/php/layout/login_form.php"); ?>
        <div class="header-login-about">
            <svg xmlns="//www.w3.org/2000/svg" version="1.1" class="svg-filters" style="display:none;">
                <defs>
                    <filter id="marker-shape">
                        <feTurbulence type="fractalNoise" baseFrequency="0 0.15" numOctaves="1" result="warp" />
                        <feDisplacementMap xChannelSelector="R" yChannelSelector="G" scale="30" in="SourceGraphic" in2="warp" />
                    </filter>
                </defs>
            </svg>
            <h4><span class="realistic-marker-highlight">What are we?</span></h4>
            <p><mark>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quia doloribus consequatur quam molestias dolore officia quis reiciendis repellat debitis aut minima vero at, est fugit tempore impedit aperiam voluptatibus a, labore voluptate praesentium! Accusantium adipisci delectus odit, vero quos distinctio perspiciatis obcaecati nihil. Voluptates facilis totam impedit expedita reiciendis rerum, voluptatum perspiciatis laboriosam non illo rem deserunt obcaecati necessitatibus ut sit. Ab itaque magnam assumenda distinctio, delectus sed ullam cumque ad doloremque amet aliquam fugiat atque labore maiores tempore perspiciatis exercitationem! Temporibus non in illo laborum sint corrupti, repellendus inventore exercitationem labore quae, maiores eaque obcaecati velit aliquid voluptates ullam?</mark></p>
        </div>
        <img src="src/img/login/Group-of-Characters.png" alt="">

    </header>

</body>

</html>