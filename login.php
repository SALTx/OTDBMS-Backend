<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'partials/imports.php'; ?>
    <?php include 'partials/helpers.php'; ?>
    <link rel="stylesheet" href="css/login.css">
    <title>OTDBMS | Login</title>
</head>

<body>
    <?php
    session_start();

    // Logs user out
    if (isset($_GET['logout'])) {
        session_destroy();
        header('Location: login.php');
        exit();
    }

    if (isset($_SESSION['username'])) {
        header('Location: index.php');
        exit();
    }

    //connect to mysql database
    $connection = connect_to_db();

    // Check if form is submitted
    if (isset($_POST['submit'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
        $result = $connection->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $_SESSION['username'] = $row['username'];
            $_SESSION['userType'] = $row['userType'];
            header('Location: index.php');
            exit();
        } else {
            header('Location: login.php?error=1');
            exit();
        }
    }

    ?>
    <?php include 'partials/nav.php'; ?>
    <div class="login-form">
        <form action="login.php" method="POST">
            <h1>Login</h1>
            <div class="content">
                <div class="input-field">
                    <input type="text" placeholder="Username" name="username">
                </div>
                <div class="input-field">
                    <input type="password" placeholder="Password" name="password">
                </div>
                <!-- <a href="#" class="link">Forgot Your Password?</a> -->
                <!-- TODO: add a forgot password link -->
            </div>
            <div class="action">
                <!-- <button>Register</button> -->
                <button type="submit" name="submit">Log in</button>
            </div>
            <?php
            if (isset($_GET['error'])) {
                echo "<div class='error'>Invalid username or password</div>";
            }
            ?>
        </form>
    </div>
    <?php include 'partials/footer.php'; ?>
</body>

</html>