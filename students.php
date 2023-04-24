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
    <script defer src="js/exportfiles.js"></script>
    <title>Students | OTDBMS</title>
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
        <h2>Table of students</h2>
        <div id="actionButtons" class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Export</h5>
                            <div class="btn-group-horizontal" role="group" aria-label="Export buttons">
                                <button type="button" id="exportToCSV" class="btn btn-warning">CSV</button>
                                <button type="button" id="exportToXLS" class="btn btn-warning">XLS</button>
                                <button type="button" id="exportToJSON" class="btn btn-warning">JSON</button>
                                <button type="button" id="exportToXML" class="btn btn-warning">XML</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Import</h5>
                            <div class="btn-group-horizontal" role="group" aria-label="Import buttons">
                                <button type="button" id="importFromCSV" class="btn btn-primary">CSV</button>
                                <button type="button" id="importFromXLS" class="btn btn-primary">XLS</button>
                                <button type="button" id="importFromJSON" class="btn btn-primary">JSON</button>
                                <button type="button" id="importFromXML" class="btn btn-primary">XML</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="table-conatainer">
            <table id="students">
                <tr>
                    <th>Admin number</th>
                    <th>Name</th>
                    <th>Admission year</th>
                    <th>Gender</th>
                    <th>Birthday</th>
                    <th>Citizenship status</th>
                    <th>diploma</th>
                    <th>PEM name</th>
                    <?php if ($admin) {
                        echo "<th>Actions</th>";
                    } ?>
                </tr>
                <?php
                //display a list of students from the students table
                $sql = "SELECT * FROM students";
                $result = $connection->query($sql);
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["adminNumber"] . "</td>";
                    echo "<td>" . $row["name"] . "</td>";
                    echo "<td>" . $row["admissionYear"] . "</td>";
                    echo "<td>" . $row["gender"] . "</td>";
                    echo "<td>" . $row["birthday"] . "</td>";
                    echo "<td>" . $row["citizenshipStatus"] . "</td>";
                    echo "<td>" . $row["diploma"] . "</td>";
                    echo "<td>" . $row["pemName"] . "</td>";
                    if ($admin) {
                        echo "<td class='tableActions'>";
                        echo "<a href='delete.php?table=students&id=" . $row["adminNumber"] . "' class='deleteButton'><i class='fa-solid fa-trash' style='color:Maroon'></i></a>";
                        echo "<a href='edit.php?table=students&id=" . $row["adminNumber"] . "'><i class='fa-solid fa-pen-to-square' style='color:darkgreen'></i></i></a>";
                        echo "</td>";
                    }
                    echo "</tr>";
                }
                //if admin make an additional row for adding a new student
                if ($admin) {
                    echo "<tr>";
                    echo "<form action='add.php' method='post'>";
                    echo "<td><input type='text' name='adminNumber' placeholder='Admin number' required></td>";
                    echo "<td><input type='text' name='name' placeholder='Name' required></td>";
                    $min_year = date("Y") - 10;
                    echo "<td><input type='number' name='admissionYear' placeholder='Admission Year' min='" . $min_year . "' max='" . date("Y") . "' required></td>";
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
                    echo "<td class='tableActions'>
                    <input type='hidden' value='students' name='table'>
                    <button type='submit'><i class='fa-solid fa-plus'></i></button>
                    <button type='reset'><i class='fa-sharp fa-solid fa-eraser'></i></button>
                    </td>";
                    echo "</form>";
                    echo "</tr>";
                }
                ?>
            </table>
        </div>

        <!-- error messages if any -->
        <?php
        if (isset($_GET['error'])) {
            echo "<p class='error'>";
            $error = $_GET['error'];
            if ($error == 'duplicateAdminNumber') {
                echo "Admin number already exists";
            } else if ($error == 'adminNumberLength') {
                echo "Invalid admin number";
            }
            echo "</p>";
        }
        ?>
    </section>

    <script>
        // when any of the anchors with deleteButton class is clicked show a popup asking if theyre sure they want to delete
        $(document).ready(function() {
            var deleteButtons = $(".deleteButton");
            deleteButtons.each(function() {
                $(this).click(function() {
                    return confirm("Are you sure you want to delete this student?");
                });
            });
        });
    </script>

    <?php include 'partials/footer.php'; ?>
</body>

</html>