<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'partials/helpers.php'; ?>
    <title>OITP | Delete</title>
</head>

<body>
    <?php
    if (isset($_GET['table']) && isset($_GET['id'])) {
        session_start();
        if (!isset($_SESSION['username']) && $_SESSION['userType'] != 'Admin') {
            header('Location: login.php');
        }

        $table = $_GET['table'];
        $id = $_GET['id'];

        $connection = connect_to_db();

        if ($table == "students") {
            $sql = "DELETE FROM students WHERE adminNumber = '$id'";
        } else if ($table == "overseasProgrammes") {
            $sql = "DELETE FROM overseasprogrammes WHERE programmeId = $id";
        } else if ($table == "trips") {
            $sql = "DELETE FROM trips WHERE tripId = $id";
        }

        if ($connection->query($sql) === TRUE) {
            header('Location: students.php');
            exit();
        } else {
            echo "Error deleting record: " . $connection->error;
        }
    } else {
        header('Location: index.php');
        exit();
    }
    ?>
</body>

</html>