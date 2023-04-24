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
    <title>Overseas Programs | OTDBMS</title>
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
                <?php if ($admin) {
                    echo "<th>Actions</th>";
                } ?>
            </tr>
            <?php
            $sql = "SELECT * FROM overseasProgrammes";
            $result = $connection->query($sql);
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["programmeId"] . "</td>";
                echo "<td>" . $row["programmeName"] . "</td>";
                echo "<td>" . $row["programmeType"] . "</td>";
                echo "<td>" . $row["startDate"] . "</td>";
                echo "<td>" . $row["endDate"] . "</td>";
                echo "<td>" . $row["country"] . "</td>";
                if ($row["aciCountry"] == 1) {
                    echo "<td>Yes</td>";
                } else {
                    echo "<td>No</td>";
                }
                if ($admin) {
                    echo "<td class='tableActions'>";
                    echo "<a href='delete.php?table=overseasProgrammes&id=" . $row["programmeId"] . "'><i class='fa-solid fa-trash' style='color:Maroon'></i></a>";
                    echo "<a href='edit.php?table=overseasProgrammes&id=" . $row["programmeId"] . "'><i class='fa-solid fa-pen-to-square' style='color:darkgreen'></i></i></a>";
                    echo "</td>";
                }
                echo "</tr>";
            }
            if ($admin) {
                echo "<tr>";
                echo "<form action='add.php' method='post'>";
                echo "<td></td>";
                echo "<td><input type='text' name='programmeName' placeholder='Name' required></td>";
                echo "<td>";
                $programmeType_values = get_enum_values($connection, "overseasProgrammes", "programmeType");
                echo "<select name='programmeType' id='programmeType' required>";
                foreach ($programmeType_values as $value) {
                    echo "<option value='$value'>$value</option>";
                }
                echo "</select>";
                echo "</td>";
                echo "<td><input type='date' name='startDate' required></td>";
                echo "<td><input type='date' name='endDate' required></td>";
                // TODO add a dropdown for countries using an external API or something
                // echo "<td><input type='text' name='country' placeholder='Country' required></td>";
                echo "<td><select name='country' id='country' required></select></td>";
                echo "<td></td>";
                echo "<td class='tableActions'>
                    <input type='hidden' value='overseasProgrammes' name='table'>
                    <button type='submit'><i class='fa-solid fa-plus'></i></button>
                    <button type='reset'><i class='fa-sharp fa-solid fa-eraser'></i></button>
                    </td>";
                echo "</form>";
                echo "</tr>";
            }
            ?>
        </table>
    </section>
    <?php include 'partials/footer.php'; ?>

    <input list="newcountry">
    <datalist id="newcountry">
    </datalist>

    <!-- script to populate country dropdown -->
    <!-- TODO: add fallback in case api doesnt exist in future -->
    <script>
        // send request to get list of countries from https://restcountries.com/v3.1/all using ajax
        $.ajax({
            url: "https://restcountries.com/v3.1/all",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // loop through the data and add each country to the dropdown
                for (let i = 0; i < data.length; i++) {
                    $("#country").append("<option value='" + data[i].name.common + "'>" + data[i].name.common + "</option>");
                    $("#newcountry").append("<option value='" + data[i].name.common + "'>" + data[i].name.common + "</option>");
                }
                console.log("number of countries loaded: " + data.length);
            },
            error: function() {
                alert("Error loading countries");
            }
        });
    </script>
</body>

</html>