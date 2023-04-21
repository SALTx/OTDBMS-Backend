<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'partials/imports.php'; ?>
    <title>OTDBMS | Login</title>
</head>

<body>
    <?php
    session_start();
    if (isset($_SESSION['username'])) {
        header('Location: index.php');
    }

    // Logs user out
    if (isset($_GET['logout'])) {
        session_destroy();
        header('Location: login.php');
    }

    //connect to mysql database
    $connection = new mysqli('localhost', 'root', '', 'otdb');
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }

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
        }
    }

    ?>
    <?php include 'partials/nav.php'; ?>
    <form action="login.php" method="POST">
        <h2>Login</h2>
        <label for="username">
            username:
            <input type="text" id="username" name="username">
        </label><br>
        <label for="password">
            password:
            <input type="password" id="password" name="password">
        </label><br>
        <input type="submit" name="submit" value="Login"> <br>
        <?php
        if (isset($_GET['error'])) {
            echo "<div id='errorMessage'>Invalid username or password</div>";
        }
        ?>
        </span>
    </form>
    <?php include 'partials/footer.php'; ?>
</body>

</html>