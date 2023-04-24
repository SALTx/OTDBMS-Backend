<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php
    include "partials/imports.php";
    include "partials/helpers.php";
    ?>
    <title>Travel Records | OTDBMS</title>
</head>

<body>
    <?php
    session_start();

    if (!isset($_SESSION['username'])) {
        header('Location: login.php');
        exit();
    }

    $admin = false;
    if ($_SESSION['userType'] == 'Admin') {
        $admin = true;
    }

    $connection = connect_to_db();
    ?>

    <?php include 'partials/nav.php'; ?>

    <section id="overseasRecords">
        <h2>Records of student overseas travel</h2>
        <table>
            <tr>
                <th>Student name</th>
                <th>Admin Number</th>
                <th>Country visited</th>
                <th>Start date</th>
                <th>End date</th>
                <th>ACI Country</th>
                <?php if ($admin) {
                    echo "<th>Delete</th>";
                } ?>
            </tr>
            <?php
            //display a list of records of student who travelled overseas from the trips table
            $sql = "SELECT students.name, students.adminNumber, overseasProgrammes.country, overseasProgrammes.startDate, overseasProgrammes.endDate, overseasProgrammes.aciCountry, trips.tripId
                            FROM trips
                            JOIN students ON students.adminNumber = trips.studentAdminNumber
                            JOIN overseasProgrammes ON overseasProgrammes.programmeId = trips.programmeId";
            $result = $connection->query($sql);
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["name"] . "</td>";
                echo "<td>" . $row["adminNumber"] . "</td>";
                echo "<td>" . $row["country"] . "</td>";
                echo "<td>" . $row["startDate"] . "</td>";
                echo "<td>" . $row["endDate"] . "</td>";
                //if aciCountry is true display yes, else display no
                if ($row["aciCountry"] == 1) {
                    echo "<td>Yes</td>";
                } else {
                    echo "<td>No</td>";
                }
                if ($admin) {
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