<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTDBMS | Home</title>
    <?php include 'partials/imports.php'; ?>
    <?php include 'partials/helpers.php'; ?>
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

    <!-- Retrieve Students, the number of trips theyve been on, and the number of trips of which were in ACI countries -->
    <?php
    echo "<script>";
    $sql = "SELECT students.name, 
    COUNT(trips.studentAdminNumber) AS total_trips, 
    SUM(CASE WHEN overseasProgrammes.aciCountry = 1 THEN 1 ELSE 0 END) AS aci_trips  
    FROM students  
    LEFT JOIN trips ON students.adminNumber = trips.studentAdminNumber  
    LEFT JOIN overseasProgrammes ON trips.programmeId = overseasProgrammes.programmeId  GROUP BY students.adminNumber;";
    $result = $connection->query($sql);

    echo "students = []; tripCount=[]; aciTripCount=[];";

    while ($row = $result->fetch_assoc()) {
        echo "students.push('" . $row["name"] . "');";
        echo "tripCount.push('" . $row["total_trips"] . "');";
        echo "aciTripCount.push('" . $row["aci_trips"] . "');";
    }
    echo "</script>";
    ?>

    <div>
        <canvas id="myChart" style="position: relative; height:40vh; width:80vw"></canvas>
    </div>

    <section id="graphControls">

    </section>

    <?php include 'partials/footer.php'; ?>

    <script>
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: students,
                datasets: [{
                    label: 'Number of overseas trips',
                    data: tripCount,
                    borderWidth: 0.5
                }, {
                    label: 'Number of trips to ACI countries',
                    data: aciTripCount,
                    borderWidth: 0.5
                }]
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: "Students"
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: "Number of trips",
                        },
                        min: 0,
                        max: 5,
                        ticks: {
                            stepSize: 1
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>

</html>