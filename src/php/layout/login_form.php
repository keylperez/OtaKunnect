<form action="src/php/action/login.php" id="signin" class="form-login disable" method="POST">
    <h2>Log-in</h2>
    <label for="log-username" class="form-label form-label-1">Username</label>
    <input type="text" name="username" id="log-username" class="form-control" required autocomplete="on">
    <label for="log-password" class="form-label form-label-2">Password</label>
    <input type="password" name="password" id="log-password" class="form-control" required autocomplete="on">
    <input type="submit" value="Log-in" name="login" class="btn btn-login btn-1">
    <button type="button" onclick="viewLogin()" class="btn btn-login btn-2">Don't have an account?</button>
    <a href="home.php">Home</a>
</form>

<form action="src/php/action/login.php" id="login" class="form-login" method="POST">
    <h2>Sign-up</h2>
    <label for="sign-name" class="form-label form-label-1">Name</label>
    <input type="text" name="name" class="form-control" id="sign-name" autofocus required autocomplete="on">
    <label for="sign-username" class="form-label form-label-2">Username</label>
    <input type="text" name="username" id="sign-username" class="form-control" required autocomplete="on">
    <label for="sign-email" class="form-label form-label-3">Email</label>
    <input type="email" name="email" id="sign-email" class="form-control" required autocomplete="on">
    <label for="sign-password" class="form-label form-label-4">Password</label>
    <input type="password" name="password" id="sign-password" class="form-control" required autocomplete="on">
    <label for="sign-confirm-password" class="form-label form-label-5">Confirm Password</label>
    <input type="password" name="confirm-password" id="sign-confirm-password" class="form-control" required autocomplete="on">
    <input type="submit" value="Sing-in" name="signin" class="btn btn-login btn-1">
    <button type="button" onclick="viewLogin()" class="btn btn-login btn-2">Already have an account?</button>
    <a href="home.php">Home</a>
</form>