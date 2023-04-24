<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'partials/helpers.php'; ?>
    <title>OITP | Add</title>
</head>

<body>
    <?php
    if (isset($_POST['table'])) {
        session_start();
        if (!isset($_SESSION['username']) && $_SESSION['userType'] != 'Admin') {
            header('Location: login.php');
        }

        $table = $_POST['table'];

        //connect to mysql server
        $connection = connect_to_db();

        if ($table == "students") {
            $name = $_POST['name'];
            $adminNumber = $_POST['adminNumber'];
            $admissionYear = $_POST['admissionYear'];
            $gender = $_POST['gender'];
            $birthday = $_POST['birthday'];
            $citizenshipStatus = $_POST['citizenshipStatus'];
            $diploma = $_POST['diploma'];
            $pemName = $_POST['pemName'];

            $sql = "INSERT INTO students (adminNumber, name, admissionYear, gender, birthday, citizenshipStatus, diploma, pemName)
                        VALUES ('$adminNumber', '$name', '$admissionYear', '$gender', '$birthday', '$citizenshipStatus', '$diploma', '$pemName')";

            if ($connection->query($sql) === TRUE) {
                header('Location: index.php');
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . $connection->error;
            }
        } else if ($table == "overseasProgrammes") {
            $programmeName = $_POST['programmeName'];
            $programmeType = $_POST['programmeType'];
            $startDate = $_POST['startDate'];
            $endDate = $_POST['endDate'];
            $country = $_POST['country'];

            // if the end date is before the start date, swap them
            if ($endDate < $startDate) {
                $temp = $endDate;
                $endDate = $startDate;
                $startDate = $temp;
            }

            $sql = "INSERT INTO overseasProgrammes (programmeName, programmeType, startDate, endDate, country)
                    VALUES ('$programmeName', '$programmeType', '$startDate', '$endDate', '$country')";

            if ($connection->query($sql) === TRUE) {
                header('Location: index.php');
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . $connection->error;
            }
        }
    } else {
        header('Location: index.php');
        exit();
    }
    ?>
</body>

</html>