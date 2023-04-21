<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>OITP | Login</title>
</head>
<body>
    <?php
        session_start();
        if(isset($_SESSION['username'])){
            header('Location: index.php');
        }

        if(isset($_GET['logout'])){
            session_destroy();
            header('Location: login.php');
        }


        //connect to mysql database
        $connection = new mysqli('localhost', 'root', '', 'otdb');
        if($connection->connect_error) {
            die("Connection failed: " . $connection->connect_error);
        }
        echo "Connected to MySql successfully";

        if(isset($_POST['submit'])){
            $username = $_POST['username'];
            $password = $_POST['password'];

            $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
            $result = $connection->query($sql);
            if($result->num_rows > 0){
                $row = $result->fetch_assoc();
                $_SESSION['username'] = $row['username'];
                $_SESSION['userType'] = $row['userType'];
                header('Location: index.php');
            } else {
                echo "Invalid username or password";
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
        <input type="submit" name="submit" value="Login">
    </form>
    <?php include 'partials/footer.php'; ?>
</body>
</html>