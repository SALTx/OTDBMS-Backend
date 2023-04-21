<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Overseas Travel Database prototype</title>
    <link rel="stylesheet" href="css/style.css">
    <?php include 'partials/imports.php'; ?>
</head>
<body>
    <?php
        //start session
        session_start();

        //see if a user is logged in and has a session, if not. go to login.php
        if(!isset($_SESSION['username'])){
            header('Location: login.php');
        }

        //see if user role is admin and set that as a bool variable
        $admin = false;
        if($_SESSION['userType'] == 'Admin'){
            $admin = true;
        }

        // connect to mysql database
        $connection = new mysqli('localhost', 'root', '', 'otdb');
        if($connection->connect_error) {
            die("Connection failed: " . $connection->connect_error);
        }

        function get_enum_values($connection, $table, $field) {
            $result = $connection->query("SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'");
            $row = $result->fetch_assoc();
            $type = $row['Type'];
            preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
            $enum = explode("','", $matches[1]);
            return $enum;
        }
                
    ?>
    <?php include 'partials/nav.php'; ?>
    <h1>Overseas Travel Database prototype</h1>
    <section>
        <h2>Table of students</h2>
        <table>
            <tr>
                <th>Admin number</th>
                <th>Name</th>
                <th>Admission year</th>
                <th>Gender</th>
                <th>Birthday</th>
                <th>Citizenship status</th>
                <th>diploma</th>
                <th>PEM name</th>
                <?php
                    if($admin){
                        echo "<th>Actions</th>";
                    }
                ?>
            </tr>
            <?php
                //display a list of students from the students table
                $sql = "SELECT * FROM students";
                $result = $connection->query($sql);
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["adminNumber"] . "</td>";
                    echo "<td>" . $row["name"] . "</td>";
                    echo "<td>" . $row["admissionYear"] . "</td>";
                    echo "<td>" . $row["gender"] . "</td>";
                    echo "<td>" . $row["birthday"] . "</td>";
                    echo "<td>" . $row["citizenshipStatus"] . "</td>";
                    echo "<td>" . $row["diploma"] . "</td>";
                    echo "<td>" . $row["pemName"] . "</td>";
                    if($admin){
                        echo "<td>";
                        echo "<a href='delete.php?table=students&id=" . $row["adminNumber"] . "'><i class='fa-solid fa-trash' style='color:Maroon'></i></a>";
                        echo "<a href='edit.php?table=students&id=" . $row["adminNumber"] . "'><i class='fa-solid fa-pen-to-square' style='color:darkgreen'></i></i></a>";
                        echo "</td>";
                    }
                    echo "</tr>";
                }
                //if admin make an additional row for adding a new student
                if($admin) {
                    echo "<tr>";
                    echo "<form action='add.php' method='post'>";
                    echo "<td><input type='text' name='adminNumber' placeholder='Admin number' required></td>";
                    echo "<td><input type='text' name='name' placeholder='Name' required></td>";
                    echo "<td><input type='number' name='admissionYear' placeholder='Admission Year' required></td>";
                    echo "<td>";
                    $gender_values = get_enum_values($connection, "students", "gender");
                    echo "<select name='gender' id='gender' required>";
                    foreach ($gender_values as $value) {
                        echo "<option value='$value'>$value</option>";
                    }
                    echo "</select>";
                    echo "</td>";
                    echo "<td><input type='date' name='birthday' required></td>";
                    echo "<td>";
                    $citizenship_values = get_enum_values($connection, "students", "citizenshipStatus");
                    echo "<select name='citizenshipStatus' id='citizenshipStatus' placeholder='Citizenship status' required>";
                    foreach ($citizenship_values as $value) {
                        echo "<option value='$value'>$value</option>";
                    }
                    echo "</select>";
                    echo "</td>";
                    echo "<td><input type='text' name='diploma' placeholder='Diploma'></td>";
                    echo "<td><input type='text' name='pemName' placeholder='PEM name' required></td>";
                    echo "<td>
                    <input type='hidden' value='students' name='table'>
                    <button type='submit'><i class='fa-solid fa-plus'></i></button>
                    </td>";
                    echo "</form>";
                    echo "</tr>";
                }
            ?>
        </table>
    </section>
    <section>
        <h2>Table of overseas programmes</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Start</th>
                <th>End</th>
                <th>country</th>
                <th>ACI</th>
                <?php
                    if($admin){
                        echo "<th>Delete</th>";
                    }
                ?>
            </tr>
            <?php
                $sql = "SELECT * FROM overseasProgrammes";
                $result = $connection->query($sql);
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["programmeId"] . "</td>";
                    echo "<td>" . $row["programmeName"] . "</td>";
                    echo "<td>" . $row["programmeType"] . "</td>";
                    echo "<td>" . $row["startDate"] . "</td>";
                    echo "<td>" . $row["endDate"] . "</td>";
                    echo "<td>" . $row["country"] . "</td>";
                    echo "<td>" . $row["aciCountry"] . "</td>";
                    if($admin){
                        echo "<td><a href='delete.php?table=overseasProgrammes&id=" . $row["programmeId"] . "'>Delete</a></td>";
                    }
                    echo "</tr>";
                }
            ?>
        </table>
    </section>
    <section>
        <h2>Records of student overseas travel</h2>
        <table>
                <tr>
                    <th>Student name</th>
                    <th>Admin Number</th>
                    <th>Country visited</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>ACI Country</th>
                    <?php
                        if($admin){
                            echo "<th>Delete</th>";
                        }
                    ?>
                </tr>
                <?php
                    //display a list of records of student overseas travel from the studentOverseasProgrammes table
                    $sql = "SELECT students.name, students.adminNumber, overseasProgrammes.country, overseasProgrammes.startDate, overseasProgrammes.endDate, overseasProgrammes.aciCountry, trips.tripId
                            FROM trips
                            JOIN students ON students.adminNumber = trips.studentAdminNumber
                            JOIN overseasProgrammes ON overseasProgrammes.programmeId = trips.programmeId";
                    $result = $connection->query($sql);
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["name"] . "</td>";
                        echo "<td>" . $row["adminNumber"] . "</td>";
                        echo "<td>" . $row["country"] . "</td>";
                        echo "<td>" . $row["startDate"] . "</td>";
                        echo "<td>" . $row["endDate"] . "</td>";
                        //if aciCountry is true display yes, else display no
                        if($row["aciCountry"] == 1){
                            echo "<td>Yes</td>";
                        } else {
                            echo "<td>No</td>";
                        }
                        if($admin){
                            echo "<td><a href='delete.php?table=trips&id=" . $row["tripId"] . "'>Delete</a></td>";
                        }
                        echo "</tr>";
                    }
                ?>
        </table>
    </section>
    <?php include 'partials/footer.php'; ?>
</body>
</html>