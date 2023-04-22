<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    //checks if admin logged in TODO: definitive edition
    session_start();
    if (!isset($_SESSION['username']) || $_SESSION['userType'] !== 'Admin') {
        header('Location: login.php');
        exit;
    }

    //connects to database
    $connection = new mysqli('localhost', 'root', '', 'otdb');
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    echo "Connected successfully";

    //handles post
    if (isset($_POST['table']) && isset($_POST['id'])) {
        echo "<script>console.log('POST');</script>";
        if ($_POST['table'] == "students") {
            $id = $_POST['id'];
            $name = $_POST['name'];
            $admissionYear = $_POST['admissionYear'];
            $gender = $_POST['gender'];
            $birthday = $_POST['birthday'];
            $citizenshipStatus = $_POST['citizenshipStatus'];
            $diploma = $_POST['diploma'];
            $pemName = $_POST['pemName'];


            $sql = "UPDATE students SET name = '$name', admissionYear = $admissionYear, gender = '$gender', birthday = '$birthday', citizenshipStatus = '$citizenshipStatus', diploma = '$diploma', pemName = '$pemName' WHERE adminNumber = '$id'";

            if ($connection->query($sql) === TRUE) {
                header('Location: index.php');
                exit();
            } else {
                echo "Error updating record: " . $connection->error;
                exit();
            }
            exit();
        } else if ($_POST['table'] == "overseasProgrammes") {
            $programmeId = $_POST['id'];
            $programmeName = $_POST['programmeName'];
            $programmeType = $_POST['programmeType'];
            $startDate = $_POST['startDate'];
            $endDate = $_POST['endDate'];
            $country = $_POST['country'];

            $sql = "UPDATE overseasProgrammes SET programmeName = '$programmeName', programmeType = '$programmeType', startDate = '$startDate', endDate = '$endDate', country = '$country' WHERE programmeId = '$programmeId'";


            if ($connection->query($sql) === TRUE) {
                header('Location: index.php');
                exit();
            } else {
                echo "Error updating record: " . $connection->error;
                exit();
            }
        }
    }


    if (!isset($_GET['table']) && !isset($_GET['id'])) {
        header('Location: index.php');
        exit();
    }

    $table = $_GET['table'];
    $id = $_GET['id'];


    function get_enum_values($connection, $table, $field)
    {
        $result = $connection->query("SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'");
        $row = $result->fetch_assoc();
        $type = $row['Type'];
        preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
        $enum = explode("','", $matches[1]);
        return $enum;
    }

    if ($table == "students") {
        $sql = "SELECT * FROM students WHERE adminNumber = '$id'";
        $result = $connection->query($sql);
        $row = $result->fetch_assoc();

        echo "<h2>Edit student</h2>";
        echo "<form action='edit.php' method='post'>";
        echo "<input type='hidden' name='table' value='students'>";
        echo "<input type='hidden' name='id' value='$id'>";
        //name(string), admissionYear(number), gender(enum), birthday(date), citizenshipStatus(enum), diploma(string), pemName(string)
        echo "<label for='name'>Name</label>";
        echo "<input type='text' name='name' value='{$row['name']}'>";

        echo "<label for='admissionYear'>Admission year</label>";
        echo "<input type='number' name='admissionYear' value='{$row['admissionYear']}'>";

        echo "<label for='gender'>Gender</label>";
        echo "<select name='gender'>";
        $values = get_enum_values($connection, 'students', 'gender');
        foreach ($values as $value) {
            if ($value == $row['gender']) {
                echo "<option value='$value' selected>$value</option>";
            } else {
                echo "<option value='$value'>$value</option>";
            }
        }
        echo "</select>";

        echo "<label for='birthday'>Birthday</label>";
        echo "<input type='date' name='birthday' value='{$row['birthday']}'>";

        echo "<label for='citizenshipStatus'>Citizenship Status</label>";
        echo "<select name='citizenshipStatus'>";
        $values = get_enum_values($connection, 'students', 'citizenshipStatus');
        foreach ($values as $value) {
            if ($value == $row['citizenshipStatus']) {
                echo "<option value='$value' selected>$value</option>";
            } else {
                echo "<option value='$value'>$value</option>";
            }
        }
        echo "</select>";

        echo "<label for='diploma'>Diploma</label>";
        echo "<input type='text' name='diploma' value='{$row['diploma']}'>";

        echo "<label for='pemName'>PEM Name</label>";
        echo "<input type='text' name='pemName' value='{$row['pemName']}'>";
        echo "<input type='submit' value='Submit'>";
        echo "</form>";
    } else if ($table = "overseasProgrammes") {
        $sql = "SELECT * FROM overseasProgrammes WHERE programmeId = '$id'";
        $result = $connection->query($sql);
        $row = $result->fetch_assoc();

        echo "Edit overseas programme";
        echo "<form action='edit.php' method='post'>";
        echo "<input type='hidden' name='table' value='overseasProgrammes'>";
        echo "<input type='hidden' name='id' value='$id'>";
        //programmeId(int), programmeName(string), programmeType(enum), startDate(date), endDate(date), country(String), aciCountry(boolean)
        echo "<label for='programmeName'>Programme Name</label>";
        echo "<input type='text' name='programmeName' value='{$row['programmeName']}'>";
        echo "<label for='programmeType'>Programme Type</label>";
        echo "<select name='programmeType'>";
        $values = get_enum_values($connection, 'overseasProgrammes', 'programmeType');
        foreach ($values as $value) {
            if ($value == $row['programmeType']) {
                echo "<option value='$value' selected>$value</option>";
            } else {
                echo "<option value='$value'>$value</option>";
            }
        }
        echo "</select>";
        echo "<label for='startDate'>Start Date</label>";
        echo "<input type='date' name='startDate' value='{$row['startDate']}'>";
        echo "<label for='endDate'>End Date</label>";
        echo "<input type='date' name='endDate' value='{$row['endDate']}'>";
        echo "<label for='country'>Country</label>";
        echo "<input type='text' name='country' value='{$row['country']}'>";
        echo "<label for='aciCountry'>ACI Country</label>";
        echo "<input type='submit' value='Submit'>";
        echo "</form>";
    }
    ?>
</body>

</html>